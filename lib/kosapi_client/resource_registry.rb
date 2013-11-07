require 'active_support/inflector'

module KOSapiClient
  class ResourceRegistry
    def initialize(client)
      @client = client
      load_resources(Resource)
    end

    def load_resources(module_name)
      module_name.constants.map{ |c| module_name.const_get(c) }.select { |c| c.is_a? Class }.each { |c| register_resource(c) }
    end

    def register_resource(clazz)
      @resources ||= {}
      class_key = clazz.name.underscore.to_sym
      @resources[class_key] = clazz.new

      this = self
      @client.define_singleton_method(class_key) { this.get_resource(name) }
    end

    def get_resource(name)
      @resources[name]
    end
  end
end
