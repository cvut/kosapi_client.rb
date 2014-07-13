module KOSapiClient
  module Entity
    class TimetableSlot

      attr_reader :id, :day, :parity, :room

      def initialize(id, day, parity, room)
        @id = id
        @day = day
        @parity = parity
        @room = room
      end

      def self.parse(contents)
        new(contents[:id], contents[:day], contents[:parity], contents[:room])
      end


    end
  end
end
