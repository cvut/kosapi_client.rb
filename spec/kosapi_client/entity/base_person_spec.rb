require 'spec_helper'

describe KOSapiClient::Entity::BasePerson do

  describe '#full_name' do

    it 'returns whole name with titles' do
      person = described_class.parse(first_name: 'Foo', last_name: 'Bar', titles_pre: 'Ing.', titles_post: 'Ph.D.')
      expect(person.full_name).to eq 'Ing. Foo Bar Ph.D.'
    end

    it 'skips title if not set' do
      person = described_class.parse(first_name: 'Foo', last_name: 'Bar', titles_pre: 'Ing.')
      expect(person.full_name).to eq 'Ing. Foo Bar'
    end

  end

end
