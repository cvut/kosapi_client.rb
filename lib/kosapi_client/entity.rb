require 'kosapi_client/entity/base_entity'
require 'kosapi_client/entity/course_event'

module KOSapiClient
  module Entity

    def self.convert(attrs)
      symbolize_keys!(attrs)
      if is_feed?(attrs)
        AtomFeed.new(attrs)
      else
        clazz = infer_class(attrs)
        if clazz
          clazz.new(attrs)
        end
      end
    end

    def self.is_feed?(attrs)
      attrs.has_key?(:feed)
    end

    def self.infer_class(attrs)
      type = extract_type(attrs)
      match_class(type)
    end

    def self.extract_type(attrs)
      if attrs.has_key?(:id) && attrs[:id].start_with?('urn:cvut:kos:')
        attrs[:id].split(':')[3]
      end
    end

    def self.match_class(type)
      case type
        when 'courseevent' then CourseEvent
        else
          nil
      end
    end

    def self.symbolize_keys!(attrs)
      if attrs.is_a?(Array)
        attrs.each do |value|
          symbolize_keys!(value)
        end
      elsif attrs.respond_to?(:keys)
        attrs.keys.each do |key|
          value = attrs.delete(key)
          new_key = key.to_sym rescue key
          attrs[new_key] = value.respond_to?(:each) ? symbolize_keys!(value) : value
        end
      end
      attrs
    end
  end
end