module KOSapiClient
  KOSAPI_ROOT_URL = 'https://kosapi.fit.cvut.cz/api/3/'

  def self.new(credentials, root_url = KOSAPI_ROOT_URL)
    http_client = OAuthHttpClient.new(credentials, root_url)
    KOSapiClient::ApiClient.new(http_client)
  end


  class ApiClient
    KOSapiClient::Resource.constants.map{|m| KOSapiClient::Resource.const_get(m) }.select { |m| m.is_a? Module }.each{ |m| include m }
    #include Resource::CourseEvents

    attr_reader :http_client

    ##
    # Creates a new KOSapi client.
    #
    def initialize(client)
      @http_client = client
    end

  end
end
