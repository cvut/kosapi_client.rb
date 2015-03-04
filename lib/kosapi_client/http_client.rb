module KOSapiClient
  class HTTPClient

    def initialize(http_adapter, preprocessor = ResponsePreprocessor.new, converter = ResponseConverter.new)
      @http_adapter = http_adapter
      @preprocessor = preprocessor
      @converter = converter
    end

    def send_debug_request(verb, url, options = {})
      send_request verb, url, options, true
    end

    def send_request(verb, url, options = {}, debug_request = false)
      absolute_url = get_absolute_url(url)

      p ">> #{absolute_url}" if debug_request

      result = @http_adapter.send_request(verb, absolute_url, options)
      process_response(result, debug_request)
    end

    def process_response(result, debug_request = false)
      preprocessed = @preprocessor.preprocess(result)

      return preprocessed if debug_request

      response = KOSapiClient::KOSapiResponse.new(preprocessed)
      @converter.convert(response, create_context)
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
