module KOSapiClient
  class ResponseConverter

    def initialize()

    end

    def process_response(response)
      #response = preprocess(response)
      if response.is_paginated?
       items = response.map{ |p| convert_type(p, response.detect_type) }
       Entity::ResultPage.new(items, response.start_index, response.has_next, nil)
      else
       convert_type(response.content, response.detect_type)
      end
    end

    def convert_type(response_part, type)
      type.parse(response_part)
    end

  end
end
