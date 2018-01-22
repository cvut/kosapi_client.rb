module KOSapiClient
  module Resource
    class DivisionsBuilder < RequestBuilder

      def courses
        raise 'Call #find({division_id}) before asking for courses' unless id_set?
        url_builder.set_path(id, 'courses')
        self
      end

      def subdivisions
        raise 'Call #find({division_id}) before asking for subdivisions' unless id_set?
        url_builder.set_path(id, 'subdivisions')
        self
      end

      def teachers
        raise 'Call #find({division_id}) before asking for teachers' unless id_set?
        url_builder.set_path(id, 'teachers')
        self
      end
    end
  end
end
