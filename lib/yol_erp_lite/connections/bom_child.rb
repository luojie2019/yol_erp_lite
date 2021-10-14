module YolErpLite
  module Connection
    module BomChild
      def get_bom_children(params)
        http_get(bom_children_path, params)
      end

      private

      def bom_children_path
        "open_api/bom_children"
      end
    end
  end
end
