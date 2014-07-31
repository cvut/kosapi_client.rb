require 'kosapi_client/entity/link'

module KOSapiClient
  class ResponseLinks

    attr_reader :prev, :next

    def initialize(prev_link, next_link)
      @prev = prev_link
      @next = next_link
    end

    class << self

      def parse(hash, client)
        prev_link = parse_link(hash, 'prev', client)
        next_link = parse_link(hash, 'next', client)
        new(prev_link, next_link)
      end

      private
      def parse_link(hash, rel, client)
        return nil unless hash
        link_hash = extract_link_hash(hash, rel)
        if link_hash
          link = Entity::Link.parse(link_hash)
          link.inject_client(client)
          link
        end
      end

      def extract_link_hash(hash, rel)
        hash = [hash] unless hash.instance_of?(Array)
        hash.find { |it| it[:rel] == rel }
      end

    end

  end
end
