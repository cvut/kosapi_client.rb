module KOSapiClient
  class HTTPResponse

    attr_reader :contents

    def initialize(result, preprocessor = HTTPResponsePreprocessor.new)
      @result = result
      @contents = preprocessor.preprocess(result.parsed)
    end

    def is_paginated?
      contents[:feed]
    end

  end
end
