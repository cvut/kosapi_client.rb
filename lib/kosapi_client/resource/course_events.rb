module KOSapiClient
  module Resource
    module CourseEvents
      def course_events(options = {})
        token.get('courseEvents')
      end
    end
  end
end
