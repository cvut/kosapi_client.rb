require 'oauth2'

module KOSapiClient
  AUTH_URL = 'https://auth.fit.cvut.cz/oauth/oauth/authorize'
  TOKEN_URL = 'https://auth.fit.cvut.cz/oauth/oauth/token'

  def self.new(client_id, client_secret, root_url = 'https://kosapi.fit.cvut.cz/api/3/')
    KOSapiClient::Client.new(client_id, client_secret, root_url)
  end

  class Client
    def initialize(client_id, client_secret, root_url)
      @client = OAuth2::Client.new(client_id, client_secret, site: root_url, authorize_url: AUTH_URL, token_url: TOKEN_URL)
      @token = @client.client_credentials.get_token
    end

    def course_events
      @token.get('courseEvents')
    end

  end
end
