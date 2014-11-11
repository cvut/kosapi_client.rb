module KOSapiClient
  module Resource
    class CourseEventsBuilder < RequestBuilder

      def attendees
        raise 'Call #find({course_event_id}) before asking for attendees' unless id_set?
        url_builder.set_path(id, 'attendees')
        self
      end

    end
  end
end