require 'spec_helper'

describe KOSapiClient::Entity::Boolean do

  describe '.parse' do

    subject(:boolean) { described_class }

    it 'parses true string to true' do
      expect(boolean.parse('true')).to be true
    end

    it 'parses false string to false' do
      expect(boolean.parse('false')).to be false
    end

    it 'throws error with invalid string' do
      expect { boolean.parse('invalid') }.to raise_error(RuntimeError)
    end

  end

end
