module YolErpLite
  module Connection
    module Material
      def get_materials(params)
        http_get(materials_path, params)
      end

      private

      def materials_path
        "open_api/materials"
      end
    end
  end
end
