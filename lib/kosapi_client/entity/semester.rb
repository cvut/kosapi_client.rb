module KOSapiClient
  module Entity
    class Semester < BaseEntity

      map_data :start_date, Time
      map_data :end_date, Time
      map_data :name, MLString
    end
  end
end

