module KOSapiClient
  class HTTPResponsePreprocessor

    def preprocess(response)
      HashUtils::symbolize_keys(response)
    end

  end
end
