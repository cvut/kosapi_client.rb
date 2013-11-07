module KOSapiClient
  module Entity
    class BaseEntity
      attr_reader :attrs

      def initialize(attrs)
        @attrs = attrs
      end

      def self.data_reader(name, opts = {})
        path = opts[:path] || :feed
        source = opts[:src] || name
        if path
          define_method(name) { @attrs[path][source] }
        else
          define_method(name) { @attrs[source] }
        end
      end
    end
  end
end

