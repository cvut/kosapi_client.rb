require 'spec_helper'

describe KOSapiClient::ResourceRegistry do
  let(:client) { double() }
  subject(:registry) { KOSapiClient::ResourceRegistry.new(client) }

  it 'registers all resources from module Resources' do

  end

  it 'registers resource instance' do
    test_class_instance = double()
    test_class = double(name: 'TestClass', new: test_class_instance)
    registry.register_resource(test_class)

    expect(registry.get_resource(:test_class)).to be test_class_instance
  end

  it 'returns registered resource instance'
end