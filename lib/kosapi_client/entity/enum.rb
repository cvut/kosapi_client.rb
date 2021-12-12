module KOSapiClient
  module Entity
    class Enum

      def self.parse(contents, context = {})
        contents.downcase.to_sym
      end

    end
  end
end
