require 'oauth2'

module KOSapiClient
  class OAuth2HttpAdapter

    DEFAULT_AUTH_URL = 'https://auth.fit.cvut.cz/oauth/oauth/authorize'
    DEFAULT_TOKEN_URL = 'https://auth.fit.cvut.cz/oauth/oauth/token'

    def initialize(credentials, root_url, opts = {})
      auth_url = opts[:auth_url] || DEFAULT_AUTH_URL
      token_url = opts[:token_url] || DEFAULT_TOKEN_URL
      MultiXml.parser = :ox # make sure to use Ox because of different namespace handling in other MultiXML parsers
      @client = OAuth2::Client.new(credentials[:client_id], credentials[:client_secret], site: root_url, authorize_url: auth_url, token_url: token_url)
    end

    def send_request(verb, url, options = {})
      token.request(verb, url, options)
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

