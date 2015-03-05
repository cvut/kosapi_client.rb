module KOSapiClient
  module Resource
    class SemestersBuilder < RequestBuilder
      ###
      # Semestry:
      #   GET /semesters              =>  client.semesters.items
      #   GET /semesters/{code}       =>  client.semesters.find({code})
      #   GET /semesters/current      =>  client.semesters.current
      #   GET /semesters/next         =>  client.semesters.next
      #
      # TODO:
      #   GET /semesters/prev
      #   GET /semesters/scheduling
      ###

      ###
      # GET /semesters
      # Vrátí všechny semestry.
      #
      # URI: https://kosapi.fit.cvut.cz/api/3/semesters/
      #
      # Typ obsahu: Semester
      # Parametry: fields, lang, limit, locEnums, multilang, offset, orderBy, query
      #
      # @link: https://kosapi.fit.cvut.cz/projects/kosapi/wiki/Semesters#GET-semesters
      ##
      # Example:
      #   client.semesters.items
      ###

      ###
      # GET /semesters/{code}
      # Vrátí konkrétní semestr podle jeho KOSího kódu.
      #
      # URI: https://kosapi.fit.cvut.cz/api/3/semesters/{code}
      #
      # Typ obsahu: Semester
      # Proměnné: {code} kód semestru
      # Parametry: fields, lang, locEnums, multilang
      #
      # @link: https://kosapi.fit.cvut.cz/projects/kosapi/wiki/Semesters#GET-semesterscode
      ##
      # Example:
      #   client.semesters.find({code})
      ###

      ###
      # GET /semesters/current
      # Vrátí aktuální semestr, ve kterém probíhá výuka (v KOS parametr AKTSEM).
      #
      # URI: https://kosapi.fit.cvut.cz/api/3/semesters/current
      # Typ obsahu: Semester
      # Parametry: fields, lang, locEnums, multilang
      #
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
      # Vrátí příští semestr, tj. následující po aktuálním.
      #
      # URI: https://kosapi.fit.cvut.cz/api/3/semesters/next
      #
      # Typ obsahu: Semester
      # Parametry: fields, lang, locEnums, multilang
      #
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
      # Vrátí předchozí semestr.
      #
      # URI: https://kosapi.fit.cvut.cz/api/3/semesters/prev
      #
      # Typ obsahu: Semester
      # Parametry: fields, lang, locEnums, multilang
      #
      # @link: https://kosapi.fit.cvut.cz/projects/kosapi/wiki/Semesters#GET-semestersprev
      ##
      # Example:
      #
      ###

      ###
      # TODO
      # GET /semesters/scheduling
      # Vrátí semestr, ve kterém probíhají zápisy do rozvrhu (v KOS parametr SEMPROROZ).
      #
      # URI: https://kosapi.fit.cvut.cz/api/3/semesters/scheduling
      #
      # Typ obsahu: Semester
      # Parametry: fields, lang, locEnums, multilang
      #
      # @link: https://kosapi.fit.cvut.cz/projects/kosapi/wiki/Semesters#GET-semestersscheduling
      ##
      # Example:
      #
      ###
    end
  end
end
