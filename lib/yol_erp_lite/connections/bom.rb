module YolErpLite
  module Connection
    module Bom
      def get_boms(params)
        http_get(boms_path, params)
      end

      def get_bom_children(params)
        http_get(bom_children_path, params)
      end

      private

      def boms_path
        "open_api/boms"
      end

      def bom_children_path
        "open_api/boms/children"
      end
    end
  end
end
