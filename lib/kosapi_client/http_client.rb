module KOSapiClient
  class HTTPClient

    def initialize(http_adapter, preprocessor = ResponsePreprocessor.new, converter = ResponseConverter.new)
      @http_adapter = http_adapter
      @preprocessor = preprocessor
      @converter = converter
    end

    def send_request(verb, url, options = {})
      result = @http_adapter.send_request(verb, url, options)
      process_response(result)
    end

    def process_response(result)
      preprocessed = @preprocessor.preprocess(result)
      response = KOSapiClient::KOSapiResponse.new(preprocessed)
      @converter.convert(response)
    end

  end
end
