module KOSapiClient
  module Entity
    class BaseEntity

      include DataMappings

      map_data :id, String, namespace: :atom
      map_data :title, String, namespace: :atom
      map_data :updated, Time, namespace: :atom
      map_data :link, Link, namespace: :atom
      map_data :author, Author, namespace: :atom

    end
  end
end

