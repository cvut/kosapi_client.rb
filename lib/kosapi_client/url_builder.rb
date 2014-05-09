module KOSapiClient
  class URLBuilder

    def initialize(root_url)
      @root_url = root_url
      @template = URITemplate.new(root_url + '{/segments*}{?query*}')
      @segments = []
      @query = {}
    end

    def set_path(*segments)
      @segments = segments
    end

    def set_query_param(param, value)
      @query[param] = value
    end

    def url
      @template.expand(segments: @segments, query: @query)
    end

  end
end
