module KOSapiClient

  # This class converts parsed response in hash format
  # (wrapped in Response) into domain Ruby objects.
  # Root domain object type is
  # determined at runtime based on API response.

  class ResponseConverter

    # Returns processed entries converted into domain objects
    # wrapped into ResultPage class instance.
    # @param items [Array] Array of hashes corresponding to entries
    # @return [ResultPage] ResultPage of domain objects

    def convert_paginated(items)
      converted_items = items.map{ |p| convert_type(p, detect_type(p)) }
      Entity::ResultPage.new(converted_items, 0, nil)
    end

    def convert_single(item)
      type = detect_type(item)
      convert_type(item, type)
    end

    private
    def convert_type(hash, type)
      type.parse(hash)
    end

    def detect_type(hash)
      type_str = hash[:xsi_type]
      extract_type(type_str)
    end

    def extract_type(type_str)
      type_name = type_str.camelize
      Entity.const_get(type_name)
    end

  end
end
