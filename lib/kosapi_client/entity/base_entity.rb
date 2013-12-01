module KOSapiClient
  module Entity
    class BaseEntity

      include DataMappings

      map_data :id
      map_data :title
      map_data :updated, Time
      map_data :link, Link
      map_data :author, Author

    end
  end
end

