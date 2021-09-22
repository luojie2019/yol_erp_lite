module YolErpLite
  module Connection
    module Base
      def http_post(url, params)
        uri = URI(url)
        req = Net::HTTP.new(uri.host, uri.port)
        header = {'content-type': 'application/json', 'token': get_access_token}
        req.use_ssl = true if uri.scheme == 'https'
        res = req.post("#{uri.path}?#{uri.query}", params.to_json, header)
        handle_res(res)
      end

      def http_get(path, params)
        uri = URI.join(host, path)
        req = Net::HTTP.new(uri.host, uri.port)
        header = {'token': get_access_token}
        req.use_ssl = true if uri.scheme == 'https'
        uri.query = URI.encode_www_form(params)
        res = req.get("#{uri.path}?#{uri.query}", header)
        handle_res(res)
      end

      def get_access_token
        if redis.nil?
          access_token = get_token(corpsecret)
        else
          access_token = redis.get("erp_lite_access_token")
          if access_token.nil?
            access_token = redis.get("erp_lite_access_token")
            if access_token.nil?
              raise Exception.new("ErpLite access token authorize false, corpsecret: #{corpsecret}")
            else
              redis.set("erp_lite_access_token", access_token)
              redis.expire("erp_lite_access_token", 7200)
            end
          end
        end
        access_token
      end

      private

      def get_token(corpsecret)
        JWT.encode({exp: (Time.now+7200).to_i}, corpsecret, 'HS256') rescue nil
      end

      def handle_res(res)
        if res.code == '200'
          return JSON.parse(res.body)["data"]
        else
          return {:code => res.code}.to_json
        end
      end
    end
  end
end
