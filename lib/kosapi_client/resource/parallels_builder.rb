module KOSapiClient
  module Resource
    class ParallelsBuilder < RequestBuilder

      def related
        raise 'Call #find before asking for related parallels' unless id_set?
      end

      def students

      end

    end
  end
end

