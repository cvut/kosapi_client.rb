module KOSapiClient
  class RequestBuilderDelegator

    def initialize(request_builder)
      @request_builder = request_builder
      @response = nil
    end

    alias :super_method_missing :method_missing

    def method_missing(method, *args)
      if @response
        delegate_to_response(method, *args)
      else
        delegate_to_builder(method, *args)
      end
    end

    def respond_to_missing?(method, include_all)
      if @response
        @response.respond_to?(method, include_all)
      else
        @request_builder.respond_to?(method, include_all)
      end
    end

    private
    def delegate_to_response(method, *args)
      if @response.respond_to?(method)
        @response.send(method, *args)
      else
        super_method_missing(method, *args)
      end
    end

    def delegate_to_builder(method, *args)
      if @request_builder.respond_to?(method)
        @request_builder.send(method, *args)
      else
        @request_builder.finalize
        @response = @request_builder.response
        delegate_to_response(method, *args)
      end
    end

  end
end
