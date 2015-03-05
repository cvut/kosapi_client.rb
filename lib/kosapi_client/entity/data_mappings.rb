module KOSapiClient
  module Entity
    module DataMappings

      def self.included(base)
        base.extend(ClassMethods)
      end

      def to_hash
        result = {}
        self.class.attr_mappings.each_key { |k| result[k] = convert_value(send(k)) }
        result
      end

      def dump
        self.to_hash.to_yaml
      end

      private
      def convert_value(val)
        if val.respond_to? :to_hash
          val.to_hash
        elsif val.is_a?(Array)
          val.map { |it| convert_value(it) }
        else
          val
        end
      end

      module ClassMethods

        def map_data(name, type=String, opts = {})
          attr_accessor name
          opts[:type] = type
          @data_mappings ||= {}
          @data_mappings[name] = opts
        end

        def attr_mappings
          if self.superclass.respond_to? :attr_mappings
            parent_mappings = self.superclass.attr_mappings
          end
          @data_mappings.reverse_merge(parent_mappings || {})
        end

        # Parses composed domain type from hash response structure.
        #
        # @param [Hash] content hash structure from API response corresponding to single domain object
        # @return [BaseEntity] parsed domain object
        def parse(content, context = {})
          instance = new
          set_mapped_attributes(instance, content, context)
          instance
        end

        # Creates new domain object instance and sets values
        # of mapped domain object attributes from source hash.
        # Attributes are mapped by .map_data method.
        def set_mapped_attributes(instance, source_hash, context)
          if self.superclass.respond_to? :set_mapped_attributes
            self.superclass.set_mapped_attributes(instance, source_hash, context)
          end
          raise "Missing data mappings for entity #{self}" unless @data_mappings
          @data_mappings.each do |name, options|
            set_mapped_attribute(instance, name, source_hash, options, context)
          end
        end

        private
        def set_mapped_attribute(instance, name, source_hash, mapping_options, context)
          namespace = mapping_options[:namespace]
          src_element = mapping_options[:element] || name
          if namespace
            key = "#{namespace}_#{src_element}".to_sym
          else
            key = src_element
          end
          value = source_hash[key]
          if value.nil?
            raise "Missing value for attribute #{name}" if mapping_options[:required]
            if mapping_options[:type].is_a?(Array)
              value = []
            else
              return
            end
          else
            value = convert_type value, mapping_options[:type], context
          end
            instance.send("#{name}=".to_sym, value)
        end

        def convert_type(value, type, context = {})
          return value.to_i if type == Integer
          return value if type == String
          return convert_array(value, type.first, context) if type.is_a?(Array)

          return type.parse(value, context) if type.respond_to? :parse
          raise "Unknown type #{type} to convert value #{value} to."
        end

        # Converts values of array type to proper domain objects.
        # It checks whether the value is really an array, because
        # when API returns a single value it does not get parsed
        # into an array.
        def convert_array(values, type, context)
          if values.is_a?(Array)
            values.map { |it| convert_type(it, type, context) }
          else
            [ convert_type(values, type, context) ]
          end
        end

      end
    end
  end
end
