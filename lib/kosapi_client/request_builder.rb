module KOSapiClient
  class RequestBuilder

    attr_reader :response

    def find(id)
      @id = id
      @url_builder.set_path(id)
      self
    end

    def offset(num)
      @url_builder.set_query_param(:offset, num)
      self
    end

    def limit(num)
      @url_builder.set_query_param(:limit, num)
      self
    end

    def sem(code)
      @url_builder.set_query_param(:sem, code)
      self
    end

    def query(params = {})
      raise 'Empty parameters to query are not allowed' if params.empty?
      if params.instance_of?(String)
        rsql = params
      else
        rsql = params.map { |k, v| "#{k}==#{v}" }.join(';')
      end
      @url_builder.set_query_param(:query, rsql)
      self
    end

    alias where query

    def initialize(resource_name, http_client, url_builder = URLBuilder.new(resource_name.to_s))
      @base_url = resource_name
      @http_client = http_client
      @operation = :get
      @body = nil
      @headers = {}
      @url_builder = url_builder
      @id = nil
    end

    def finalize
      options = {headers: @headers, body: @body }
      @response = @http_client.send_request(@operation, @url_builder.url, options)
    end

    private
    attr_reader :url_builder, :id

    def id_set?
      @id
    end

  end
end

