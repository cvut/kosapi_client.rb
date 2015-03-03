module KOSapiClient

  class ApiClient
    include ResourceMapper

    # accessible resources definition
    resource :courses
    resource :course_events
    resource :parallels
    resource :exams
    resource :semesters

    attr_reader :http_client

    ##
    # Creates a new KOSapi client.
    #
    def initialize(http_client, base_url = DEFAULT_KOSAPI_BASE_URL)
      @http_client = http_client
      @base_url = base_url
    end

    def create_builder(resource_name)
      builder_name = "#{resource_name}_builder".camelize.to_sym
      builder_class = find_builder_class(builder_name)
      builder_class.new(resource_name.to_s.camelize(:lower), @http_client)
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
