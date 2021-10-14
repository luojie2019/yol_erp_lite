module YolErpLite
  module Connection
    module Bom
      def get_boms(params)
        http_get(boms_path, params)
      end

      private

      def boms_path
        "open_api/boms"
      end
    end
  end
end
