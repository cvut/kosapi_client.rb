require 'oauth2'

module KOSapiClient
  AUTH_URL = 'https://auth.fit.cvut.cz/oauth/oauth/authorize'
  TOKEN_URL = 'https://auth.fit.cvut.cz/oauth/oauth/token'
  KOSAPI_ROOT_URL = 'https://kosapi.fit.cvut.cz/api/3/'

  def self.new(client_id, client_secret, root_url = KOSAPI_ROOT_URL)
    KOSapiClient::Client.new(client_id, client_secret, root_url)
  end


  class Client
    include Resource::CourseEvents

    ##
    # Creates new KOSapi client with supplied oauth credentials.
    #
    # No effort will be made to validate the credentials before
    # a resource method is called. If you require oauth credentials
    # validation right after client creation then force oauth
    # token retrieval with a call to #authorize.
    #
    def initialize(client_id, client_secret, root_url = KOSAPI_ROOT_URL)
      @client = OAuth2::Client.new(client_id, client_secret, site: root_url, authorize_url: AUTH_URL, token_url: TOKEN_URL)
    end

    def authorize
      @token = @client.client_credentials.get_token
    end

    def token
      authorize if !@token || @token.expired?
      @token
    end

    def get(url)
      token.get(url).parsed
    end
  end
end
