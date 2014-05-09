module KOSapiClient
  class RequestBuilderDelegator

    def initialize(request_builder)
      @request_builder = request_builder
      @response = nil
    end

    def method_missing(method, *args)
      if @response.nil?
        if @request_builder.respond_to?(method)
          @request_builder.send(method, *args)
        else
          @request_builder.finalize
          @response = @request_builder.response
          @response.send(method, *args)
        end
      else
        if @response.respond_to?(:method)
          @response.send(method, *args)
        else
          super
        end
      end
    end

    def respond_to?(method)

    end

  end
end
