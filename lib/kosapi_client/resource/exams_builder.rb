module KOSapiClient
  module Resource
    class ExamsBuilder < RequestBuilder

      def attendees
        raise 'Call #find before asking for related parallels' unless id_set?
        url_builder.set_path(id, 'attendees')
        self
      end

    end
  end
end