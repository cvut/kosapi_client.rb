module KOSapiClient
  class Configuration < Struct.new(:client_id, :client_secret, :base_url)

    DEFAULT_OPTIONS = {
      base_url: 'https://kosapi.fit.cvut.cz/api/3'
    }

    def initialize(options = {})
      DEFAULT_OPTIONS.merge(options).each do |option, value|
        self[option] = value
      end
    end

    def credentials
      if client_id && client_secret
        {client_id: client_id, client_secret: client_secret}
      else
        {}
      end
    end

  end
end
