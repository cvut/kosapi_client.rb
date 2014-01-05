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

        def parse(content)
          instance = new()
          set_mapped_attributes(instance, content)
          instance
        end

        def convert_type(value, type)
          return value.to_i if type == Integer
          return value if type == String
          return type.parse(value) if type.respond_to? :parse
          raise "Unknown type #{type} to convert value #{value} to."
        end

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
      end
    end
  end
end
