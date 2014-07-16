module KOSapiClient
  module Entity
    class TimetableSlot

      include DataMappings

      map_data :id, Integer
      map_data :day, Integer
      map_data :duration, Integer
      map_data :first_hour, Integer
      map_data :parity, Enum
      map_data :room, Link

    end
  end
end
