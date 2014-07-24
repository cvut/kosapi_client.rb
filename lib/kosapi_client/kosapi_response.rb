module KOSapiClient
  class KOSapiResponse

    attr_reader :contents

    def initialize(result, preprocessor = ResponsePreprocessor.new, converter = ResponseConverter.new)
      @result = result
      @preprocessor = preprocessor
      @converter = converter
    end

    def convert
      parsed_contents = @result.parsed
      raise 'Wrong type of parsed response. HTTP response body is probably invalid or incomplete.' unless parsed_contents.instance_of?(Hash)
      @contents = @preprocessor.preprocess(parsed_contents)
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
