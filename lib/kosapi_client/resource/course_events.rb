module KOSapiClient
  module Resource
    module CourseEvents
      def course_events(options = {})
        http_client.get('courseEvents', options)
      end
    end
  end
end
