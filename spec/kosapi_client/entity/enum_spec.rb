require 'spec_helper'

describe KOSapiClient::Entity::Enum do

  Enum = KOSapiClient::Entity::Enum

  describe '.parse' do

    it 'parses a string to a symbol' do
      res = Enum.parse('foo')
      expect(res).to eq :foo
    end

    it 'downcases the string before converting to a symbol' do
      res = Enum.parse('FOO')
      expect(res).to eq :foo
    end

  end
end
