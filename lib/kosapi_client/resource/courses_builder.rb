module KOSapiClient
  module Resource
    class CoursesBuilder < RequestBuilder

      def detail(level = 1)
        url_builder.set_query_param(:detail, level)
        self
      end

      # Selects courses scheduled in the specified semester(s).
      def sem(*semesters)
        url_builder.set_query_param(:sem, semesters.join(','))
        self
      end

      alias semester sem
    end
  end
end
