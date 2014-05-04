module KOSapiClient
  module Resource
    module Courses

      def courses(options = {})
        http_client.get('courses', options)
      end

    end
  end
end
