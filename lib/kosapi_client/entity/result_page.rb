module KOSapiClient
  module Entity

    # ResultPage instance is returned from requests to all paginated resources.
    # It wraps returned objects, stores additional feed metadata and it also
    # helps to do things like auto pagination and next / previous page callbacks.
    class ResultPage

      include Enumerable

      attr_reader :items
      attr_accessor :auto_paginate

      def initialize(items, links, auto_paginate = true)
        @items = items
        @links = links
        @auto_paginate = auto_paginate
      end

      def count
        @items.count
      end

      def next
        @links.next
      end

      def prev
        @links.prev
      end

      def each(&block)
        return to_enum(__method__) unless block_given?
        items.each(&block)
        return unless @auto_paginate
        next_link = self.next
        while next_link
          next_page = next_link.follow
          next_link = next_page.next
          next_page.items.each(&block)
        end
      end

    end
  end
end
