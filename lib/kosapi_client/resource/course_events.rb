module KOSapiClient
  module Resource
    module CourseEvents
      def course_events(options = {})
        get('courseEvents', options)
      end
    end
  end
end
