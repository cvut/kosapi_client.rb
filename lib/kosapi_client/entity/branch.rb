module KOSapiClient
  module Entity
    class Branch < BaseEntity
      map_data :abbrev
      map_data :capacity, Integer
      map_data :code
      map_data :description, MLString
      map_data :diploma_name, MLString
      map_data :division, Link
      map_data :guarantor, Link
      map_data :name, MLString
      map_data :open_for_admission, Boolean
    end
  end
end
