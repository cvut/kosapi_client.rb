module KOSapiClient
  class HTTPClient

    def initialize(http_adapter)
      @http_adapter = http_adapter
    end

    def send_request(verb, url, options = {})
      response = @http_adapter.send_request(verb, url, options)
      response.convert
    end


  end
end
