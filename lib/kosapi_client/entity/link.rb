module KOSapiClient
  module Entity
    class Link

      attr_reader :title, :href, :rel

      def initialize(title, href, rel)
        @title = title
        @href = href
        @rel = rel
      end

      def self.parse(contents, context = {})
        href = contents[:xlink_href] || contents[:href]
        new(contents[:__content__], href, contents[:rel])
      end

      def id
        @href.split('/').last
      end

    end
  end
end
