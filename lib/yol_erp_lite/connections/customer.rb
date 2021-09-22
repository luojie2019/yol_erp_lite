module YolErpLite
  module Connection
    module Customer
      def get_customers(params)
        http_get(customers_path, params)
      end

      private

      def customers_path
        "open_api/customers"
      end
    end
  end
end
