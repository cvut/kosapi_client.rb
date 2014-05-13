module KOSapiClient
  class HTTPResponse

    include Enumerable

    attr_reader :contents
    attr_accessor :offset

    def initialize(result, preprocessor = ResponsePreprocessor.new, converter = ResponseConverter.new)
      @result = result
      @contents = preprocessor.preprocess(result.parsed)
      @converter = converter
    end

    def convert
      if is_paginated?
        @converter.convert_paginated(items)
      else
        @converter.convert_single(item)
      end
    end

    private
    def is_paginated?
      contents[:feed]
    end

    def items
      if is_paginated?
        contents[:feed][:entry]
      else
        [contents[:entry]]
      end
    end

    def item
      items.first
    end

    def each(&block)
      items.each(&block)
    end

    def detect_type
      type_str = sample_entry[:xsi_type]
      extract_type(type_str)
    end

    def offset


    end

    def sample_entry
      items.first
    end

    def extract_type(type_str)
      type_name = type_str.camelize
      Entity.const_get(type_name)
    end
  end
end
