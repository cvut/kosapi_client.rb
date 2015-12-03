module KOSapiClient
  module Resource
    class TeachersBuilder < RequestBuilder

      # XXX: This is quite insane, we need some support to DRY subresources.
      %w[courses parallels exams timetable].each do |resource|
        define_method(resource) do |semester: 'current'|
          raise "Call #find({username}) before asking for #{resource}" unless id_set?
          url_builder.set_path(id, resource)
          url_builder.set_query_param(:sem, semester)
          self
        end
      end
    end
  end
end
