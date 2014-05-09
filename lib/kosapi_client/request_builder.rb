module KOSapiClient
  class RequestBuilder



    def initialize(root_url, http_client)
      @root_url = root_url
      @http_client = http_client
      @operation = :get
      @finalized = false
    end

    def method_missing(method, *args)
      finalize unless @finalized

      if @result.respond_to?(method)
        @result.send(method, *args)
      else
        super
      end
    end

    def finalize
      @finalized = true
      request_url = build_url
      @result = @http_client.send_request(@operation, request_url)
    end

    def build_url

    end

  end
end

