require 'date'

module KOSapiClient
  module Entity
    class Exam < BaseEntity

      map_data :cancel_deadline, Time
      map_data :capacity, Integer
      map_data :course, Link
      map_data :department, Link
      map_data :end_date, Time
      map_data :examiner, Link
      map_data :examiners, [Link], element: :teacher, path: :examiners
      map_data :note
      map_data :occupied, Integer
      map_data :resit, Boolean
      map_data :room, Link
      map_data :semester, Link
      map_data :signin_deadline, Date
      map_data :start_date, Time
      map_data :substitutes, Enum
      map_data :superior, Link
      map_data :term_type, Enum 

    end
  end
end
