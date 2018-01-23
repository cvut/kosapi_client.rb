require 'oauth2'

module KOSapiClient
  class OAuth2HttpAdapter

    DEFAULT_AUTH_URL = 'https://auth.fit.cvut.cz/oauth/authorize'
    DEFAULT_TOKEN_URL = 'https://auth.fit.cvut.cz/oauth/token'

    attr_reader :base_url

    def initialize(credentials, base_url, opts = {})
      @base_url = base_url
      @credentials = { client_id: credentials[:client_id] , client_secret: credentials[:client_secret] }
      auth_url = opts[:auth_url] || DEFAULT_AUTH_URL
      token_url = opts[:token_url] || DEFAULT_TOKEN_URL
      MultiXml.parser = :ox # make sure to use Ox because of different namespace handling in other MultiXML parsers
      @client = OAuth2::Client.new(
        credentials[:client_id],
        credentials[:client_secret],
        auth_scheme: :basic_auth,
        site: base_url,
        authorize_url: auth_url,
        token_url: token_url)
      construct_token(credentials[:client_token]) if credentials[:client_token]
    end

    def send_request(verb, url, options = {})
      raise 'No credentials set' if @credentials.empty?
      token.request(verb, url, options)
    end

    def get_token
      token
    end

    private
    def authenticate
      @token = @client.client_credentials.get_token
    end

    def token
      authenticate if !@token || @token.expired?
      @token
    end

    def construct_token(token_hash)
      @token = OAuth2::AccessToken.from_hash(@client, token_hash)
    end
  end
end
