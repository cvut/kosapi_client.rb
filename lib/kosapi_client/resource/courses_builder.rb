module KOSapiClient
  module Resource
    class CoursesBuilder < RequestBuilder

      def detail(level = 1)
        @url_builder.set_query_param(:detail, level)
        self
      end

      ###
      # GET /courses/{code}/parallels
      #
      # URI: https://kosapi.fit.cvut.cz/api/3/courses/{code}/parallels/
      # @link: https://kosapi.fit.cvut.cz/projects/kosapi/wiki/Courses#GET-coursescodeparallels
      ##
      # Example:
      #   client.courses.find({course_code}).parallels
      #   client.courses.find({course_code}).sem({semester_code}).parallels
      ###
      def parallels
        raise 'Call #find before asking for parallels' unless id_set?
        url_builder.set_path(id, 'parallels')
        self
      end

      ###
      # GET /courses/{code}/students
      #
      # URI: https://kosapi.fit.cvut.cz/api/3/courses/{code}/students/
      # @link: https://kosapi.fit.cvut.cz/projects/kosapi/wiki/Courses#GET-coursescodestudents
      ##
      # Example:
      #   client.courses.find({course_code}).students
      #   client.courses.find({course_code}).sem({semester_code}).students
      ###
      def students
        raise 'Call #find before asking for students' unless id_set?
        url_builder.set_path(id, 'students')
        self
      end

      ###
      # GET /courses/{code}/instances
      #
      # URI: https://kosapi.fit.cvut.cz/api/3/courses/{code}/instances/
      # @link: https://kosapi.fit.cvut.cz/projects/kosapi/wiki/Courses#GET-coursescodeinstances
      ##
      # Example:
      #   client.courses.find({course_code}).instances
      ###
      def instances
        raise 'Call #find before asking for course instances' unless id_set?
        url_builder.set_path(id, 'instances')
        self
      end

      ###
      # GET /courses/{code}/instances/{semester}
      ###
      def instance(semester)
        raise 'Call #find before asking for course instance' unless id_set?
        url_builder.set_path(id, 'instances', semester)
        finalize
      end
    end
  end
end
