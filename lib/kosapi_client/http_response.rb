module KOSapiClient
  class HTTPResponse

    include Enumerable

    attr_reader :contents

    def initialize(result, preprocessor = ResponsePreprocessor.new)
      @result = result
      @contents = preprocessor.preprocess(result.parsed)
    end

    def is_paginated?
      contents[:feed]
    end

    def items
      contents[:feed][:entry]
    end

    def each(&block)
      contents[:feed][:entry].each(&block)
    end
  end
end
