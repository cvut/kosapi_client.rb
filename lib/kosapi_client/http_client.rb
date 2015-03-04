module KOSapiClient
  class HTTPClient

    def initialize(http_adapter, preprocessor = ResponsePreprocessor.new, converter = ResponseConverter.new)
      @http_adapter = http_adapter
      @preprocessor = preprocessor
      @converter = converter
    end

    def send_debug_request(verb, url, options = {})
      send_request verb, url, options, false
    end

    def send_request(verb, url, options = {}, convert_response = true)
      absolute_url = get_absolute_url(url)
      result = @http_adapter.send_request(verb, absolute_url, options)
      process_response(result, convert_response)
    end

    def process_response(result, convert_response = true)
      preprocessed = @preprocessor.preprocess(result)
      response = KOSapiClient::KOSapiResponse.new(preprocessed)

      return @converter.convert response, create_context if convert_response

      response
    end

    def get_absolute_url(url)
      if is_absolute(url)
        url
      else
        "#{@http_adapter.base_url}/#{url}"
      end
    end

    def create_context
      {
          client: self
      }
    end

    private
    def is_absolute(url)
      url.start_with?('http')
    end

  end
end
