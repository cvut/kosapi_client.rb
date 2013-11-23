module KOSapiClient
  class HTTPClient

    def initialize(http_adapter, response_converter = ResponseConverter.new)
      @http_adapter = http_adapter
      @response_converter = response_converter
    end

    def get(url, options = {})
      response = @http_adapter.get(url)
      @response_converter.process_response(response)
    end

  end
end
