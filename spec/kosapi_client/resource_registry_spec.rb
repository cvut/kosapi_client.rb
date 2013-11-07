require 'spec_helper'

describe KOSapiClient::ResourceRegistry do
  let(:client) { double() }
  subject(:registry) { KOSapiClient::ResourceRegistry.new(client) }
  let(:test_class_instance) { double() }
  let(:test_class) { double(name: 'TestClass', new: test_class_instance) }

  it 'registers resources from module Resources' do
    expect(client.respond_to?(:course_event)).to be_true
  end

  it 'registers resource instance' do
    registry.register_resource(test_class)
    expect(registry.get_resource(:test_class)).to be test_class_instance
  end

end