module KOSapiClient
  module Entity
    class Teacher < BasePerson

      map_data :division, Link
      map_data :extern, Boolean
      map_data :email
      map_data :phone
      map_data :stageName
      map_data :supervision_phd_students, Enum, element: :supervision_ph_d_students

    end
  end
end
