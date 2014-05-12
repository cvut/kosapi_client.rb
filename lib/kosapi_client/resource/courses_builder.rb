module KOSapiClient
  module Resource
    class CoursesBuilder < RequestBuilder

      def detail(level = 1)
        @url_builder.set_query_param(:detail, level)
        self
      end

    end
  end
end
