using Corefines::String::camelcase

module KOSapiClient

  class ApiClient
    include ResourceMapper

    # accessible resources definition
    resource :branches
    resource :courses
    resource :course_events
    resource :divisions
    resource :parallels
    resource :parameters
    resource :exams
    resource :semesters
    resource :teachers

    attr_reader :http_client

    ##
    # Creates a new KOSapi client.
    #
    def initialize(config = Configuration.new)
      http_adapter = OAuth2HttpAdapter.new(config.credentials, config.base_url, config.to_h)
      @http_client = HTTPClient.new(http_adapter)
    end

    def create_builder(resource_name)
      builder_name = "#{resource_name}_builder".camelcase(:upper).to_sym
      builder_class = find_builder_class(builder_name)
      builder_class.new(resource_name.to_s.camelcase(:lower), @http_client)
    end

    private
    def find_builder_class(builder_name)
      KOSapiClient::Resource.constants.each do |m|
        constant = KOSapiClient::Resource.const_get(m)
        if constant.is_a?(Class) && m == builder_name
          return constant
        end
      end
      RequestBuilder
    end

  end
end