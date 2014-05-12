module KOSapiClient
  class HTTPClient

    def initialize(http_adapter, response_converter = ResponseConverter.new)
      @http_adapter = http_adapter
      @response_converter = response_converter
    end

    def send_request(verb, url, options = {})
      response = @http_adapter.send_request(verb, url, options)
      #response.offset = options[:offset]
      @response_converter.process_response(response)
    end


  end
end
