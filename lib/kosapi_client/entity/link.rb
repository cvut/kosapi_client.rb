module KOSapiClient
  module Entity
    class Link

      attr_reader :link_title, :link_href, :link_rel

      def initialize(title, href, rel, client = nil)
        @link_title = title
        @link_href = href
        @link_rel = rel
        @client = client
      end

      def self.parse(contents)
        href = contents[:xlink_href] || contents[:href]
        new(contents[:__content__], href, contents[:rel])
      end

      def link_id
        @link_href.split('/').last
      end

      def follow
        raise "HTTP client not set, cannot send request to #{link_href}" unless @client
        @client.send_request(:get, link_href)
      end

      def inject_client(client)
        @client = client
      end

      def target
        @target ||= follow
      end

      def to_hash
        { href: link_href, rel: link_rel, title: link_title }
      end

      def method_missing(method, *args, &block)
        target.send(method, *args, &block)
      end

      def respond_to_missing?(method_name, include_private = false)
        target.respond_to?(method_name, include_private)
      end

    end
  end
end
