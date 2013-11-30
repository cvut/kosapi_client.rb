module KOSapiClient
  module Entity
    class Link

      attr_reader :title, :href

      def initialize(title, href)
        @title = title
        @href = href
      end

      def self.parse(contents)
        new(contents[:href], contents[:__content__])
      end
    end
  end
end
