require 'oauth2'

module KOSapiClient
  class OAuthHttpClient
    AUTH_URL = 'https://auth.fit.cvut.cz/oauth/oauth/authorize'
    TOKEN_URL = 'https://auth.fit.cvut.cz/oauth/oauth/token'

    def initialize(credentials, root_url)
      @client = OAuth2::Client.new(credentials[:client_id], credentials[:client_secret], site: root_url, authorize_url: AUTH_URL, token_url: TOKEN_URL)
    end

    def authenticate
      @token = @client.client_credentials.get_token
    end

    def token
      authenticate if !@token || @token.expired?
      @token
    end

    def get(url, options = {})
      parsed_response = token.get(url, params: options).parsed
      Entity::convert(parsed_response)
    end
  end
end

