module KOSapiClient
  class HTTPResponse
     attr_reader :contents

    def initialize(result)
      @result = result
      @contents = preprocess_contents(result.parsed)
    end

    def is_paginated?
      contents[:feed]
    end

    private                                                                                                                     n
    def preprocess_contents(contents)

    end

   def symbolize_keys!(attrs)
     if attrs.is_a?(Array)
       symbolize_keys attrs
     elsif attrs.respond_to?(:keys)
       attrs.deep_transform_keys { |key| key.to_sym rescue key }
     end



     if attrs.is_a?(Array)
       attrs.each do |value|
         symbolize_keys!(value)
       end
     elsif attrs.respond_to?(:keys)
       attrs.keys.each do |key|
         value = attrs.delete(key)
         new_key = key.to_sym rescue key
         attrs[new_key] = value.respond_to?(:each) ? symbolize_keys!(value) : value
       end
     end
     attrs
   end

  end
end
