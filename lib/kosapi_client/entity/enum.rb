module KOSapiClient
  module Entity
    class Enum

      def self.parse(contents)
        contents.downcase.to_sym
      end

    end
  end
end
