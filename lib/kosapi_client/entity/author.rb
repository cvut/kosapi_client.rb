module KOSapiClient
  module Entity
    class Author

      attr_reader :name

      def initialize(name)
        @name = name
      end

      def self.parse(contents, context = {})
        new(contents[:atom_name])
      end
    end
  end
end

