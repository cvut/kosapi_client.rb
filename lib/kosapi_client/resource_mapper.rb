module KOSapiClient
  module ResourceMapper

    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods

      def resource(name)
        define_method name do
          builder = create_builder name
          RequestBuilderDelegator.new(builder)
        end
      end

    end

  end
end
