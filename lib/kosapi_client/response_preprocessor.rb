using Corefines::String::snake_case

module KOSapiClient
  class ResponsePreprocessor

    def preprocess(result)
      response = extract_parsed(result)
      result = stringify_keys(response)
      entries_to_array(result)
      merge_contents(result)
      result
    end


    private
    def extract_parsed(result)
      parsed_contents = result.parsed
      raise 'Wrong type of parsed response. HTTP response body is probably invalid or incomplete.' unless parsed_contents.instance_of?(Hash)
      parsed_contents
    end

    def stringify_keys(response)
      HashUtils.deep_transform_hash_keys(response) { |key| key.snake_case.sub(':', '_').to_sym rescue key }
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
