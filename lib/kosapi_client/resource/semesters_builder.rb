module KOSapiClient
  module Resource
    class SemestersBuilder < RequestBuilder
      ###
      # Semesters:
      #   GET /semesters              =>  client.semesters.items
      #   GET /semesters/{code}       =>  client.semesters.find({code})
      #   GET /semesters/next         =>  client.semesters.next
      #
      # TODO:
      #   GET /semesters/current      =>  client.semesters.current
      #   GET /semesters/prev
      #   GET /semesters/scheduling
      ###

      ###
      # GET /semesters
      #
      # URI: https://kosapi.fit.cvut.cz/api/3/semesters/
      # @link: https://kosapi.fit.cvut.cz/projects/kosapi/wiki/Semesters#GET-semesters
      ##
      # Example:
      #   client.semesters.items
      ###

      ###
      # GET /semesters/{code}
      #
      # URI: https://kosapi.fit.cvut.cz/api/3/semesters/{code}
      # @link: https://kosapi.fit.cvut.cz/projects/kosapi/wiki/Semesters#GET-semesterscode
      ##
      # Example:
      #   client.semesters.find({code})
      ###

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

      ###
      # TODO
      # GET /semesters/prev
      #
      # URI: https://kosapi.fit.cvut.cz/api/3/semesters/prev
      # @link: https://kosapi.fit.cvut.cz/projects/kosapi/wiki/Semesters#GET-semestersprev
      ##
      # Example:
      #
      ###

      ###
      # TODO
      # GET /semesters/scheduling
      #
      # URI: https://kosapi.fit.cvut.cz/api/3/semesters/scheduling
      # @link: https://kosapi.fit.cvut.cz/projects/kosapi/wiki/Semesters#GET-semestersscheduling
      ##
      # Example:
      #
      ###
    end
  end
end
