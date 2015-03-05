require 'spec_helper'

describe KOSapiClient::Entity::DataMappings do

  let(:dummy_class) { Class.new { include KOSapiClient::Entity::DataMappings } }
  let(:derived_class) { Class.new(dummy_class) }
  let(:dummy_instance) { dummy_class.new }

  it 'defines .parse class method' do
    expect(dummy_class).to respond_to(:parse)
  end

  it 'defines .map_data class method' do
    expect(dummy_class).to respond_to(:map_data)
  end

  describe '.parse' do

    it 'parses to string by default' do
      dummy_class.map_data :foo
      parsed = dummy_class.parse({foo: 'bar'})
      expect(parsed).to be_an_instance_of(dummy_class)
      expect(parsed.foo).to eq 'bar'
    end

    it 'parses integer type' do
      dummy_class.map_data :foo, Integer
      parsed = dummy_class.parse({foo: '1'})
      expect(parsed.foo).to eq 1
    end

    it 'parses array of types' do
      dummy_class.map_data :foo, [Integer]
      parsed = dummy_class.parse({foo: %w(5 7 11)})
      expect(parsed.foo).to eq [5, 7, 11]
    end

    it 'parses single item as array when set' do
      dummy_class.map_data :foo, [Integer]
      parsed = dummy_class.parse({foo: '11'})
      expect(parsed.foo).to eq [11]
    end

    it 'parses custom types' do
      dummy_class.map_data :foo, KOSapiClient::Entity::Enum
      parsed = dummy_class.parse({foo: 'bar'})
      expect(parsed.foo).to eq :bar
    end

    it 'throws error when required attribute is missing' do
      dummy_class.map_data :foo, String, required: true
      expect { dummy_class.parse({}) }.to raise_error(RuntimeError)
    end

    it 'sets attribute to nil when not required attribute is missing' do
      dummy_class.map_data :foo, String
      parsed = dummy_class.parse({})
      expect(parsed.foo).to be_nil
    end

    it 'throws error on type without parse method' do
      dummy_class.map_data :foo, Object
      expect{ dummy_class.parse({foo: 'bar'}) }.to raise_error(RuntimeError)
    end

    it 'accepts context hash' do
      dummy_class.map_data :foo, KOSapiClient::Entity::Enum
      context = {}
      parsed = dummy_class.parse({foo: 'bar'}, context)
      expect(parsed.foo).to eq :bar
    end

    it 'parses nil collection as empty array' do
      dummy_class.map_data :foo, [Integer]
      parsed = dummy_class.parse({ })
      expect(parsed.foo).to eq []
    end

  end

  describe '.map_data' do

    it 'maps parent attributes' do
      dummy_class.map_data :foo
      derived_class.map_data :bar
      instance = derived_class.parse({foo: '123', bar: '456'})
      expect(instance).to respond_to(:foo, :bar)
    end

    it 'does not map child attributes' do
      dummy_class.map_data :foo
      derived_class.map_data :bar
      instance = dummy_class.parse({foo: '123', bar: '456'})
      expect(instance).to respond_to(:foo)
      expect(instance).not_to respond_to(:bar)
    end


    it 'supports namespace configuration' do
      dummy_class.map_data :foo, String, namespace: :bar
      instance = dummy_class.parse({bar_foo: '123', bar: '456'})
      expect(instance.foo).to eq '123'
    end

    it 'supports source element name configuration' do
      dummy_class.map_data :foo, String, element: :bar
      instance = dummy_class.parse({bar: '123'})
      expect(instance.foo).to eq '123'
    end

    it 'supports array wrapping element name configuration' do
      dummy_class.map_data :foo, String, array_wrapper_element: :bar
      instance = dummy_class.parse(foo: {bar: ['123','456']})
      expect(instance.foo).to be_a Array
      expect(instance.foo.count).to eq 2
      expect(instance.foo.first).to eq '123'
    end

  end

  describe '#to_hash' do

    it 'converts mapped attributes to a hash' do
      dummy_class.map_data :foo
      instance = dummy_class.parse({foo: 'bar'})
      expect(instance.to_hash).to eq({foo: 'bar'})
    end

    it 'converts class hierarchy attributes to a hash' do
      dummy_class.map_data :foo
      derived_class.map_data :bar
      instance = derived_class.parse({foo: '123', bar: '456'})
      expect(instance.to_hash).to eq({foo: '123', bar: '456'})
    end

    it 'converts array to a hash' do
      dummy_class.map_data :foo, [Integer]
      instance = dummy_class.parse({foo: %w(123 456)})
      expect(instance.to_hash).to eq({foo: [123, 456]})
    end

    it 'converts nested instances' do
      dummy_class.map_data :foo
      instance = dummy_class.new()
      instance2 = dummy_class.new()
      instance.foo = instance2
      instance2.foo = 'bar'
      expect(instance.to_hash).to eq({foo: {foo: 'bar'}})
    end

    it 'converts array of nested instances' do
      dummy_class.map_data :foo
      instance = dummy_class.new()
      instance2 = dummy_class.new()
      instance.foo = [instance2]
      instance2.foo = 'bar'
      expect(instance.to_hash).to eq({foo: [{foo: 'bar'}]})
    end

  end

end
