module KOSapiClient
  module Entity
    class Course < BaseEntity
      map_data :allowed_enrollment_count, Integer
      map_data :approval_date, Time
      map_data :classes_lang, Enum
      map_data :classes_type, [Enum] #todo: possible array?
      map_data :code
      map_data :completion, Enum
      map_data :credits, Integer
      map_data :department, Link
      map_data :description
      map_data :homepage
      map_data :keywords
      map_data :lectures_contents
      map_data :literature
      map_data :name
      map_data :note
      map_data :objectives
      map_data :programme_type, Enum
      map_data :range
      map_data :requirements
      map_data :season, Enum
      map_data :state, Enum
      map_data :study_form, Enum
      map_data :superior_course, Link
      map_data :subcourses, Link
      map_data :tutorials_contents
      map_data :instance #todo

    end
  end
end
