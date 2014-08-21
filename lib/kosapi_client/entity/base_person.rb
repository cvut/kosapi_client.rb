module KOSapiClient
  module Entity
    class BasePerson < BaseEntity

      map_data :first_name
      map_data :last_name
      map_data :personal_number, Integer
      map_data :titles_post
      map_data :titles_pre
      map_data :username

    end
  end
end
