module KOSapiClient
  module Entity
    class Coursin < BaseEntity
      # TODO: Add capacity

      # XXX: This is really ugly hack! The problem is that "semester" is both
      # element and attribute, and they are mapped into single Ruby attribute.
      map_data :semester, Link, element: 1, path: :semester
      map_data :capacity_overfill, Enum
      map_data :occupied, Integer
      map_data :examiners, [Link], element: :teacher, path: :examiners
      map_data :guarantors, [Link], element: :teacher, path: :guarantors
      map_data :instructors, [Link], element: :teacher, path: :instructors
      map_data :lecturers, [Link], element: :teacher, path: :lecturers

    end
  end
end
