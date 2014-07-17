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
      if hash[:atom_feed] && hash[:atom_feed][:atom_entry].instance_of?(Hash)
        hash[:atom_feed][:atom_entry] = [hash[:atom_feed][:atom_entry]]
      end
    end

    def merge_contents(hash)
      entries = if hash[:atom_feed]
        hash[:atom_feed][:atom_entry]
      else
        [hash[:atom_entry]]
      end
      if entries
        entries.each do |entry|
          content = entry.delete(:atom_content)
          entry.merge! content if content
        end
      end

    end

  end
end
