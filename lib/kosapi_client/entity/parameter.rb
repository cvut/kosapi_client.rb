module KOSapiClient
  module Entity
    class Parameter < BaseEntity

      map_data :description, String
      map_data :key, String
      map_data :value, String
    end

    # XSI type of the Parameter entity is actually KoSetting (wtf?), thus we
    # must define this alias so ResponseConverter can find the entity class.
    KoSetting = Parameter
  end
end
