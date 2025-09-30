module KOSapiClient
  module Entity
    class ScheduleSlot < BaseEntity

      map_data :department, Link
      map_data :end_date, Time
      map_data :faculty, Link
      map_data :note, String
      map_data :occupied, Boolean
      map_data :room, Link
      map_data :start_date, Time

    end
  end
end
