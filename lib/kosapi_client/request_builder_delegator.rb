module KOSapiClient
  class RequestBuilderDelegator

    def initialize(request_builder)
      @request_builder = request_builder
      @response = nil
    end

    alias :super_method_missing :method_missing

    def method_missing(method, *args, &block)
      if @response
        delegate_to_response(method, *args, &block)
      else
        delegate_to_builder(method, *args, &block)
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
    def delegate_to_response(method, *args, &block)
      if @response.respond_to?(method)
        @response.send(method, *args, &block)
      else
        super_method_missing(method, *args)
      end
    end

    def delegate_to_builder(method, *args, &block)
      if @request_builder.respond_to?(method)
        res = @request_builder.send(method, *args, &block)
        if res.equal?(@request_builder)
          self
        else
          res
        end
      else
        @request_builder.finalize
        @response = @request_builder.response
        delegate_to_response(method, *args, &block)
      end
    end

  end
end
