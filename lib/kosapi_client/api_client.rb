module KOSapiClient

  DEFAULT_KOSAPI_ROOT_URL = 'https://kosapi.fit.cvut.cz/api/3/'

  def self.new(credentials, root_url = DEFAULT_KOSAPI_ROOT_URL)
    http_adapter = OAuth2HttpAdapter.new(credentials, root_url)
    http_client = HTTPClient.new(http_adapter)
    KOSapiClient::ApiClient.new(http_client, root_url)
  end


  class ApiClient
    include ResourceMapper

    #resource :parallels

    # Include all submodules of KOSapiClient::Resource to this class
    KOSapiClient::Resource.constants.map{|m| KOSapiClient::Resource.const_get(m) }.select { |m| m.is_a? Module }.each{ |m| include m }

    #include Resource::CourseEvents

    attr_reader :http_client

    ##
    # Creates a new KOSapi client.
    #
    def initialize(http_client, root_url = DEFAULT_KOSAPI_ROOT_URL)
      @http_client = http_client
      @root_url = root_url
    end

    def create_builder(resource_name)
      builder_name = (resource_name[0].capitalize + resource_name[1..-1] + 'Builder').to_sym
      KOSapiClient::Resource.constants.each do |m|
        constant = KOSapiClient::Resource.const_get(m)
        if constant.is_a?(Class) && m == builder_name
          return constant.new(@root_url + resource_name.to_s, @http_client)
        end
      end
      RequestBuilder.new(@root_url + resource_name.to_s, @http_client)
    end


  end
end
