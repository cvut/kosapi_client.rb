module KOSapiClient
  module Entity
    class Course < BaseEntity

      map_data :allowed_enrollment_count, Integer
      map_data :approval_date, Time
      map_data :classes_lang, Enum
      map_data :classes_type, [Enum]
      map_data :code
      map_data :completion, Enum
      map_data :credits, Integer
      map_data :department, Link
      map_data :description, MLString
      map_data :homepage
      map_data :keywords, MLString
      map_data :lectures_contents, MLString
      map_data :literature, MLString
      map_data :name, MLString
      map_data :note, MLString
      map_data :objectives, MLString
      map_data :programme_type, Enum
      map_data :range
      map_data :requirements, MLString
      map_data :season, Enum
      map_data :state, Enum
      map_data :study_form, Enum
      map_data :superior_course, Link
      map_data :subcourses, Link
      map_data :tutorials_contents, MLString
      map_data :instance, Coursin
    end
  end
end
