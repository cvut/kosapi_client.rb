require 'oauth2'

module KOSapiClient
  class OAuthHttpAdapter

    AUTH_URL = 'https://auth.fit.cvut.cz/oauth/oauth/authorize'
    TOKEN_URL = 'https://auth.fit.cvut.cz/oauth/oauth/token'

    def initialize(credentials, root_url, opts = {})
      auth_url = opts[:auth_url] || AUTH_URL
      token_url = opts[:token_url] || TOKEN_URL
      @client = OAuth2::Client.new(credentials[:client_id], credentials[:client_secret], site: root_url, authorize_url: auth_url, token_url: token_url)
    end

    def get(url, options = {})
      token.get(url, params: options)
    end

    private
    def authenticate
      @token = @client.client_credentials.get_token
    end

    def token
      authenticate if !@token || @token.expired?
      @token
    end
  end
end

