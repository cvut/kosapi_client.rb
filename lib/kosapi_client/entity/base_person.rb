module KOSapiClient
  module Entity
    class BasePerson < BaseEntity

      map_data :first_name
      map_data :last_name
      map_data :personal_number, Integer
      map_data :titles_post
      map_data :titles_pre
      map_data :username

      def full_name
        prefix = "#{titles_pre} " if titles_pre
        suffix = " #{titles_post}" if titles_post
        "#{prefix}#{first_name} #{last_name}#{suffix}"
      end

    end
  end
end
