module KOSapiClient
  module Entity
    class TimetableSlot

      attr_reader :day, :parity, :room

      def initialize(day, parity, room)
        @day = day
        @parity = parity
        @room = room
      end

      def self.parse(contents)
        new(contents[:day], contents[:parity], contents[:room])
      end


    end
  end
end
