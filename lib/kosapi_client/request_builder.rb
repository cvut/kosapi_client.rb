module KOSapiClient
  class RequestBuilder

    attr_reader :response

    def initialize(root_url, http_client, url_builder = URLBuilder.new(root_url))
      @root_url = root_url
      @http_client = http_client
      @operation = :get
      @body = nil
      @headers = []
      @url_builder = url_builder
    end

    def finalize
      @response = @http_client.send_request(@operation, @url_builder.url, @body, @headers)
    end

  end
end

