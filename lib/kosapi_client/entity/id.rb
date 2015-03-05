module KOSapiClient
  module Entity
    class Id < String

      def self.parse(str, context = {})
        id = str.split(':').last
        new(id)
      end

    end
  end
end

