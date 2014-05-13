module KOSapiClient
  module Entity

    # ResultPage instance is returned from requests to all paginated resources.
    # It wraps returned objects, stores additional feed metadata and it also
    # helps to do things like auto pagination and next / previous page callbacks.
    class ResultPage

      include Enumerable

      attr_reader :items, :start_index

      def initialize(items, start_index, next_callback = nil)
        @items = items
        @start_index = start_index
        @next_callback = next_callback
      end

      def next
        @next_callback.call if(@next_callback)
      end

      def items_count
        @items.count
      end

      def each(&block)
        @items.each(&block)
      end

    end
  end
end
