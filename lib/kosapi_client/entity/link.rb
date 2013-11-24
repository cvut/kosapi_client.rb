module KOSapiClient
  module Entity
    class Link

      attr_reader :title, :href
      def self.parse(contents)
        @href = contents[:href]
        @title = contents[:__content__]
      end
    end
  end
end
