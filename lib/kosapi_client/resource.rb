require 'kosapi_client/resource/course_events'

module KOSapiClient
  module Resource
    def self.convert(attrs)
      clazz = infer_class(attrs)
      if clazz

        clazz.new(attrs)
      end
    end

    def self.is_feed?(attrs)
      attrs.has_key?('feed')
    end

    def self.infer_class(attrs)
      type = extract_type_from_id(attrs)
      match_class(type)
    end

    def self.extract_type_from_id(attrs)
      if is_feed?(attrs)
        attrs = attrs['feed']['entry'].first
      end
      return nil unless attrs

      if attrs.has_key?('id') && attrs['id'].start_with?('urn:cvut:kos:')
        attrs['id'].split(':')[3]
      end
    end

    def self.match_class(type)
      case type
        when 'courseevent' then Entity::CourseEvent
        else
          nil
      end
    end
  end
end