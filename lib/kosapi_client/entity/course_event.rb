module KOSapiClient
  module Entity
    class CourseEvent < BaseEntity
      data_reader :capacity, type: Integer
      data_reader :room

      def initialize(attributes)
        super
      end
    end
  end
end