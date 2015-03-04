module KOSapiClient
  module Resource
    class ParallelsBuilder < RequestBuilder

      def related
        raise 'Call #find before asking for related parallels' unless id_set?
        url_builder.set_path(id, 'related')
        self
      end

      def students
        raise 'Call #find before asking for students' unless id_set?
        url_builder.set_path(id, 'students')
        self
      end
    end
  end
end

