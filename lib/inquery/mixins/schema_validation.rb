module Inquery
  module Mixins
    module SchemaValidation
      extend ActiveSupport::Concern

      included do
        class_attribute :_schema
        self._schema = nil
      end

      module ClassMethods
        def schema(schema)
          fail 'Schema must be a hash.' unless schema.is_a?(Hash)

          unless schema[:type]
            schema = {
              type: :hash,
              hash: schema
            }
          end

          self._schema = schema
        end
      end
    end
  end
end