module KOSapiClient
  module Entity
    class BaseEntity
      attr_reader :attrs

      def initialize(attrs)
        @attrs = attrs
      end

      def self.data_reader(name, path)
        define_method(name) { @attrs[path] }
      end
    end
  end
end

