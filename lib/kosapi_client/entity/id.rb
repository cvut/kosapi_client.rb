module KOSapiClient
  module Entity
    class Id < String

      def self.parse(str)
        id = str.split(':').last
        new(id)
      end

    end
  end
end

