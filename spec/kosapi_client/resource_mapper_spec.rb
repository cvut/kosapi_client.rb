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

    it 'creates method which returns builder delegator' do
      dummy_class.resource(:foo)
      allow(dummy_instance).to receive(:create_builder)
      expect(dummy_instance.foo).to be_an_instance_of(KOSapiClient::RequestBuilderDelegator)
    end

    it 'calls #create_builder' do
      dummy_class.resource(:foo)
      expect(dummy_instance).to receive(:create_builder).with(:foo)
      dummy_instance.foo
    end

  end

end
