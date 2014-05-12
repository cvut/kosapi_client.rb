module KOSapiClient

  # This class converts parsed response in hash format
  # (wrapped in Response) into domain Ruby objects.
  # Root domain object type is
  # determined at runtime based on API response.

  class ResponseConverter

    def initialize()

    end

    # Returns processed response converted into domain objects.
    # When called resource can return collection of objects
    # @param response [HTTPResponse] API response in hash format
    # @return [ResultPage] ResultPage or single domain object

    def process_response(response)
      #response = preprocess(response)
      if response.is_paginated?
       items = response.map{ |p| convert_type(p, response.detect_type) }
       Entity::ResultPage.new(items, response.offset, nil)
      else
       convert_type(response.content, response.detect_type)
      end
    end

    private
    def convert_type(response_part, type)
      type.parse(response_part)
    end

  end
end
