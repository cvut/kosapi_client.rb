module KOSapiClient
  module ResourceMapper

    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods

      def resource(name)
        define_method name do
          create_builder name
        end
      end

    end

  end
end
