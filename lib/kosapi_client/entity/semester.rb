module KOSapiClient
  module Entity
    class Semester < BaseEntity

      map_data :end_date, Time
      map_data :name, MLString
      map_data :start_date, Time
    end
  end
end
