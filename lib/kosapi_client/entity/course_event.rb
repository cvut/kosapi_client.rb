module KOSapiClient
  module Entity
    class CourseEvent < BaseEntity

      map_data :target_branch, [Link]
      map_data :capacity, Integer
      map_data :course, Link
      map_data :creator, Link
      map_data :end_date, Time
      map_data :name, MLString
      map_data :note, MLString
      map_data :occupied, Integer
      map_data :room, Link
      map_data :semester, Link
      map_data :signin_deadline, Time
      map_data :start_date, Time

    end
  end
end
