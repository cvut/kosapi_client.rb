module KOSapiClient
  module Entity
    class Boolean

      def self.parse(str, context = {})
        return true if str == 'true'
        return false if str == 'false'
        raise "Boolean parsing failed, invalid string: #{str}"
      end

    end
  end
end

