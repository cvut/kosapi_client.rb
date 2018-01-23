module KOSapiClient
  class Configuration < Struct.new(:client_id, :client_secret, :client_token, :base_url)

    DEFAULT_OPTIONS = {
      base_url: 'https://kosapi.fit.cvut.cz/api/3'
    }

    def initialize(options = {})
      DEFAULT_OPTIONS.merge(options).each do |option, value|
        self[option] = value
      end
    end

    def credentials
      if (client_id && client_secret) || client_token
#        p {:client_id => client_id, :client_secret => client_secret, :client_token => client_token}
        h = {client_id: client_id, client_secret: client_secret, client_token: client_token}
        p h
        h
      else
        {}
      end
    end

  end
end
