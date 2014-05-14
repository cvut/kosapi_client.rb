module KOSapiClient
  class Configuration

    attr_accessor :client_id, :client_secret

    def credentials
      if client_id && client_secret
        {client_id: client_id, client_secret: client_secret}
      else
        raise 'No credentials set'
      end
    end

  end
end
