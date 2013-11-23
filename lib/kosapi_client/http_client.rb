module KOSapiClient
  class HTTPClient
    def initialize(http_client, response_converter = ResponseConverter.new)
      @http_client = http_client
      @response_converter = response_converter
    end

    def get(url, options = {})
      response = @http_client.get(url)
      @response_converter.process_response(response)
    end
  end
end
