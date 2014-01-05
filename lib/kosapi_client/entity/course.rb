module KOSapiClient
  module Entity
    class Course < BaseEntity
      map_data :allowedEnrollmentCount, Integer
      map_data :approvalDate, Time
      map_data :classesLang, Enum
      map_data :classesType, Enum #todo: possible array?
      map_data :code
      map_data :completion, Enum
      map_data :credits, Integer
      map_data :department, Link
      map_data :description
      map_data :homepage
      map_data :keywords
      map_data :lecturesContents
      map_data :literature
      map_data :name
      map_data :note
      map_data :objectives
      map_data :programmeType, Enum
      map_data :range
      map_data :requirements
      map_data :season, Enum
      map_data :state, Enum
      map_data :studyForm, Enum
      map_data :superiorCourse, Link
      map_data :subcourses, Link
      map_data :tutorialsContents
      map_data :instance #todo

    end
  end
end
