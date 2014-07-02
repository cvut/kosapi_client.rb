module KOSapiClient
  class HTTPResponse

    include Enumerable

    attr_reader :contents

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
      contents[:atom_feed]
    end

    def items
      if is_paginated?
        contents[:atom_feed][:atom_entry]
      else
        [contents[:atom_entry]]
      end
    end

    def item
      items.first
    end

  end
end
