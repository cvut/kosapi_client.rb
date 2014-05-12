module KOSapiClient
  module Entity
    module DataMappings

      def self.included(base)
        base.extend(ClassMethods)
      end

      module ClassMethods

        def map_data(name, type=String, opts = {})
          attr_accessor name
          opts[:type] = type
          @@data_mappings ||= {}
          @@data_mappings[self] ||= {}
          @@data_mappings[self][name] = opts
        end

        # Parses composed domain type from hash response structure.
        #
        # @param [Hash] content hash structure from API response corresponding to single domain object
        # @return [BaseEntity] parsed domain object
        def parse(content)
          instance = new()
          set_mapped_attributes(instance, content)
          instance
        end

        # Creates new domain object instance and sets values
        # of mapped domain object attributes from source hash.
        # Attributes are mapped by .map_data method.
        def set_mapped_attributes(instance, content)
          if self.superclass.respond_to? :set_mapped_attributes
            self.superclass.set_mapped_attributes(instance, content)
          end
          raise "Missing data mappings for entity #{self}" unless @@data_mappings[self]
          @@data_mappings[self].each do |name, options|
            value_to_convert = content[name]
            if value_to_convert.nil?
              raise "Missing value for attribute #{name}" if options[:required]
              next
            end
            value = convert_type(content[name], options[:type])
            instance.send("#{name}=".to_sym, value)
          end
        end

        def convert_type(value, type)
          return value.to_i if type == Integer
          return value if type == String
          return convert_array(value, type.first) if type.is_a?(Array)

          return type.parse(value) if type.respond_to? :parse
          raise "Unknown type #{type} to convert value #{value} to."
        end

        def convert_array(value, type)
          if value.is_a?(Array)
            value.map { |it| convert_type(it, type) }
          else
            convert_type(value, type)
          end
        end


      end
    end
  end
end
