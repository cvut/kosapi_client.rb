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

      # XXX: This is quite insane, we need some support to DRY subresources.
      %w[events exams parallels students instances branches].each do |resource|
        define_method(resource) do |semester: 'current'|
          raise "Call #find({course_code}) before asking for #{resource}" unless id_set?
          url_builder.set_path(id, resource)
          url_builder.set_query_param(:sem, semester)
          self
        end
      end

      def parallel(code, semester: 'current')
        raise 'Call #find({course_code}) before asking for parallel' unless id_set?
        url_builder.set_path(id, 'parallels', code)
        url_builder.set_query_param(:sem, semester)
        self
      end
    end
  end
end
