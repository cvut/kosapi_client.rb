module KOSapiClient
  module Entity
    class Division < BaseEntity

      map_data :abbrev, MLString
      map_data :code
      map_data :name, MLString
      map_data :parent, Link
      map_data :division_type, Enum

    end
  end
end
