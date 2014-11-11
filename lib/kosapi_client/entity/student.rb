module KOSapiClient
  module Entity
    class Student < BasePerson

      map_data :branch, Link
      map_data :department, Link
      map_data :email
      map_data :start_date, Time
      map_data :faculty, Link
      map_data :grade, Integer
      map_data :interrupted_until, Time
      map_data :programme, Link
      map_data :end_date, Time
      map_data :study_form, Enum
      map_data :study_group, Integer
      map_data :study_plan, Link
      map_data :study_state, Enum
      map_data :supervisor, Link
      map_data :supervisor_specialist, Link
      map_data :study_termination_reason, Enum
      map_data :code

    end
  end
end
