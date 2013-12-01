module KOSapiClient
  module Entity
    class Link

      attr_reader :title, :href, :rel

      def initialize(title, href, rel)
        @title = title
        @href = href
        @rel = rel
      end

      def self.parse(contents)
        new(contents[:href], contents[:__content__], contents[:rel])
      end
    end
  end
end
