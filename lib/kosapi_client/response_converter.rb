module KOSapiClient

  # This class converts parsed response in hash format
  # (wrapped in Response) into domain Ruby objects.
  # Root domain object type is
  # determined at runtime based on API response.

  class ResponseConverter

    def initialize(client)
      @client = client
    end

    def convert(response)
      if response.is_paginated?
        convert_paginated(response)
      else
        convert_single(response.item)
      end
    end

    # Returns processed entries converted into domain objects
    # wrapped into ResultPage class instance.
    # @param response [KOSapiResponse] Response object wrapping array of hashes corresponding to entries
    # @return [ResultPage] ResultPage of domain objects

    def convert_paginated(response)
      items = response.items || []
      converted_items = items.map{ |p| convert_single(p) }
      Entity::ResultPage.new(converted_items, create_links(response))
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
      begin
        entity_type = Entity.const_get(type_name)
      rescue
        raise "Unknown entity type: #{type_name}"
      end
      entity_type
    end

    def create_links(response)
      ResponseLinks.parse(response.links_hash, @client)
    end

  end
end
