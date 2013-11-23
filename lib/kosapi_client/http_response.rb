module KOSapiClient
  class HTTPResponse

    attr_reader :contents

    def initialize(result, response_preprocessor = HTTPResponsePreprocessor.new)
      @result = result
      @contents = response_preprocessor.preprocess(result.parsed)
    end

    def is_paginated?
      contents[:feed]
    end

  end
end
