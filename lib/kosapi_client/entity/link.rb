module KOSapiClient
  module Entity
    class Link

      attr_reader :title, :href, :rel

      def initialize(title, href, rel, client = nil)
        @title = title
        @href = href
        @rel = rel
        @client = client
      end

      def self.parse(contents, context = {})
        href = contents[:xlink_href] || contents[:href]
        new(contents[:__content__], href, contents[:rel])
      end

      def id
        @href.split('/').last
      end

      def follow
        raise "HTTP client not set, cannot send request to #{href}" unless @client
        @client.send_request(:get, href)
      end

      def inject_client(client)
        @client = client
      end

    end
  end
end
