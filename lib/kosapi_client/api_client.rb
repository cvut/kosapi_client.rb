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



  end

  class ApiClient
    include ResourceMapper

    # accessible resources definition
    resource :courses
    resource :course_events
    resource :parallels

    attr_reader :http_client

    ##
    # Creates a new KOSapi client.
    #
    def initialize(http_client, root_url = DEFAULT_KOSAPI_ROOT_URL)
      @http_client = http_client
      @root_url = root_url
    end

    def create_builder(resource_name)
      builder_name = "#{resource_name}_builder".camelize.to_sym
      builder_class = find_builder_class(builder_name)
      builder_class.new(@root_url + resource_name.to_s, @http_client)
    end

    private
    def find_builder_class(builder_name)
      KOSapiClient::Resource.constants.each do |m|
        constant = KOSapiClient::Resource.const_get(m)
        if constant.is_a?(Class) && m == builder_name
          return constant
        end
      end
      RequestBuilder
    end

  end
end
