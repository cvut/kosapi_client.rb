module KOSapiClient

  DEFAULT_KOSAPI_ROOT_URL = 'https://kosapi.fit.cvut.cz/api/3/'

  singleton_class.class_eval do

    def new(credentials, root_url = DEFAULT_KOSAPI_ROOT_URL)
      http_adapter = OAuth2HttpAdapter.new(credentials, root_url)
      http_client = HTTPClient.new(http_adapter)
      ApiClient.new(http_client, root_url)
    end

    def configure
      config = Configuration.new
      yield config
      @client = new(config.credentials)
    end

    # Calling this method clears stored ApiClient instance
    # if configured previously.
    def reset
      @client = nil
    end

    def method_missing(method, *args, &block)
      if @client.nil?
        raise "Client not configured. Either you forgot to call configure or you have typo in method name '#{method}'."
      end
      if @client.respond_to?(method)
        @client.send(method, *args, &block)
      else
        super
      end
    end

    def respond_to_missing?(method_name, include_private = false)
      @client.respond_to?(method_name, include_private)
    end

  end

end
