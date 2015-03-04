module KOSapiClient
  module Entity
    class Coursin < BaseEntity

      map_data :capacity
      map_data :capacity_overfill, Integer
      map_data :course # TODO: fix circular reference. map_data :course, Course
      map_data :occupied, Integer
      map_data :semester
      map_data :tutorial_capacity, Integer
      map_data :examiners, [Link], array_wrapper_element: :teacher
      map_data :guarantors, [Link], array_wrapper_element: :teacher
      map_data :instructors, [Link], array_wrapper_element: :teacher
      map_data :lecturers, [Link], array_wrapper_element: :teacher
    end
  end
end
