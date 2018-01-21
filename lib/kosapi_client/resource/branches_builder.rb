module KOSapiClient
  module Resource
    class BranchesBuilder < RequestBuilder
      def study_plans
        raise 'Call #find before asking for branch\'s study plans' unless id_set?
        url_builder.set_path(id, 'studyPlans')
        self
      end
    end
  end
end
