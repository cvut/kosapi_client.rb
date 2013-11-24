module KOSapiClient
  class ResponsePreprocessor

    def preprocess(response)
      HashUtils::deep_transform_hash_keys(response) { |key| key.underscore.to_sym rescue key  }
    end

  end
end
