module KOSapiClient
  module Resource
    module Parallels

      def parallels(options = {})
        http_client.get('parallels', options)
      end

    end
  end
end

