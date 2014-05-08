module KOSapiClient
  class RequestBuilderDelegator

    def initialize(request_builder)
      @request_builder = request_builder
      @response = nil
    end

    def method_missing(name, *args)

    end

    def respond_to?(name)

    end

  end
end
