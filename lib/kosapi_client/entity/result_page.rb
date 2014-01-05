module KOSapiClient
  module Entity
    class ResultPage

      include Enumerable

      attr_reader :items, :start_index

      def initialize(items, start_index, next_callback)
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
