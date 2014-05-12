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
        new(contents[:__content__], contents[:href], contents[:rel])
      end
    end
  end
end
