module KOSapiClient
  class HTTPClient

    def initialize(http_adapter, preprocessor = ResponsePreprocessor.new, converter = ResponseConverter.new)
      @http_adapter = http_adapter
      @preprocessor = preprocessor
      @converter = converter
    end

    def send_request(verb, url, options = {})
      absolute_url = get_absolute_url(url)
      result = @http_adapter.send_request(verb, absolute_url, options)
      process_response(result)
    end

    def process_response(result)
      preprocessed = @preprocessor.preprocess(result)
      response = KOSapiClient::KOSapiResponse.new preprocessed
      @converter.convert response, create_context
    end

    def get_absolute_url(url)
      if is_absolute(url)
        url
      else
        "#{@http_adapter.base_url}/#{url}"
      end
    end

    private
    def is_absolute(url)
      url.start_with?('http')
    end

    def create_context
      {
          client: self
      }
    end

  end
end
