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

    def method_missing(method, *args, &block)
      if @client.respond_to?(method)
        @client.send(method, *args, &block)
      else
        super
      end
    end

  end

end
