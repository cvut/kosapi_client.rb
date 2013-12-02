module KOSapiClient

  DEFAULT_KOSAPI_ROOT_URL = 'https://kosapi.fit.cvut.cz/api/3/'

  def self.new(credentials, root_url = DEFAULT_KOSAPI_ROOT_URL)
    http_adapter = OAuthHttpAdapter.new(credentials, root_url)
    http_client = HTTPClient.new(http_adapter)
    KOSapiClient::ApiClient.new(http_client)
  end


  class ApiClient

    KOSapiClient::Resource.constants.map{|m| KOSapiClient::Resource.const_get(m) }.select { |m| m.is_a? Module }.each{ |m| include m }
    #include Resource::CourseEvents

    attr_reader :http_client

    ##
    # Creates a new KOSapi client.
    #
    def initialize(http_client)
      @http_client = http_client
    end

  end
end
