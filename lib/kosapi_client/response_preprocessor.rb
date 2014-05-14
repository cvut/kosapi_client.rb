module KOSapiClient
  class ResponsePreprocessor

    def preprocess(response)
      result = stringify_keys(response)
      entries_to_array(result)
      merge_contents(result)
      result
    end


    private
    def stringify_keys(response)
      HashUtils.deep_transform_hash_keys(response) { |key| key.underscore.sub(':', '_').to_sym rescue key }
    end

    def entries_to_array(hash)
      if hash[:feed] && hash[:feed][:entry].instance_of?(Hash)
        hash[:feed][:entry] = [hash[:feed][:entry]]
      end
    end

    def merge_contents(hash)
      entries = if hash[:feed]
        hash[:feed][:entry]
      else
        [hash[:entry]]
      end
      entries.each do |entry|
        content = entry.delete(:content)
        entry.merge! content if content
      end

    end

  end
end
