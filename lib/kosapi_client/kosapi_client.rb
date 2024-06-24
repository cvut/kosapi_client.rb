module KOSapiClient

  singleton_class.class_eval do

    def new(options = {})
      ApiClient.new(Configuration.new(options))
    end

    def configure
      reset
      yield config
      self
    end

    def client
      @client ||= ApiClient.new(config)
    end

    # Calling this method clears stored ApiClient instance
    # if configured previously.
    def reset
      @config = nil
      @client = nil
    end

    def method_missing(method, *args, &block)
      if client.respond_to?(method)
        client.send(method, *args, &block)
      else
        super
      end
    end

    def respond_to_missing?(method_name, include_private = false)
      client.respond_to?(method_name, include_private)
    end

    private
    def config
      @config ||= Configuration.new
    end

  end

end