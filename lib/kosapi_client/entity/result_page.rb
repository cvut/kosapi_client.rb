module KOSapiClient
  module Entity
    class ResultPage

      include Enumerable

      attr_reader :items, :start_index, :has_next

      def initialize(items, start_index, has_next, next_callback)
        @items = items
        @start_index = start_index
        @has_next = has_next
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
