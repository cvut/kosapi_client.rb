module KOSapiClient
  module Entity
    class Parallel < BaseEntity

      map_data :capacity, Integer
      map_data :capacity_overfill#, Permission
      map_data :code, Integer
      map_data :course, Link
      map_data :parallel_type#, ParallelType
      map_data :enrollment#, Permission
      map_data :note, MLString
      map_data :occupied, Integer
      map_data :semester, Link
      map_data :teachers, [Link]
      map_data :timetable_slots, [TimetableSlot], element: :timetable_slot

    end
  end
end

