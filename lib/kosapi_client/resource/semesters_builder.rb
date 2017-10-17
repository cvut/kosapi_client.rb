module KOSapiClient
  module Resource
    class SemestersBuilder < RequestBuilder

      ###
      # GET /semesters/current
      #
      # URI: https://kosapi.fit.cvut.cz/api/3/semesters/current
      # @link: https://kosapi.fit.cvut.cz/projects/kosapi/wiki/Semesters#GET-semesterscurrent
      ##
      # Example:
      #   client.semesters.current
      ###
      def current
        find 'current'
      end

      ###
      # GET /semesters/next
      #
      # URI: https://kosapi.fit.cvut.cz/api/3/semesters/next
      # @link: https://kosapi.fit.cvut.cz/projects/kosapi/wiki/Semesters#GET-semestersnext
      ##
      # Example:
      #   client.semesters.next
      ###
      def next
        find 'next'
      end

    end
  end
end
