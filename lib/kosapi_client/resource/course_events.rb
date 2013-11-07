module KOSapiClient
  module Resource
    class CourseEvents
      def course_events(options = {})
        get('courseEvents', options)
      end
    end
  end
end
