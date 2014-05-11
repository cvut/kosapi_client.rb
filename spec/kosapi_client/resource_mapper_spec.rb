require 'spec_helper'

describe KOSapiClient::ResourceMapper do

  let(:dummy_class) { Class.new { include KOSapiClient::ResourceMapper } }
  let(:dummy_instance) { dummy_class.new }

  it 'defines class method .resource' do
    expect(dummy_class).to respond_to(:resource)
  end

  describe '.resource' do

    it 'creates instance method with the resource name' do
      dummy_class.resource(:foo)
      expect(dummy_instance).to respond_to(:foo)
    end

    it 'calls #create_builder' do
      dummy_class.resource(:foo)
      expect(dummy_instance).to receive(:create_builder).with(:foo)
      dummy_instance.foo
    end

  end

end
