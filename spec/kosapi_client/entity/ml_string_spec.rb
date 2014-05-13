require 'spec_helper'

describe KOSapiClient::Entity::MLString do

  MLString = described_class

  def translations
    @translations || {en: 'Lorem Ipsum', cs: 'Foo'}
  end

  let(:mlstring) { MLString.new(translations) }

  describe '.parse' do

    it 'parses itself from a hash' do
      str = MLString.parse({xml_lang: :en, __content__: 'Lorem Ipsum'})
      expect(str.translations).to eq({en: 'Lorem Ipsum'})
    end

  end

  describe '#to_s' do

    it 'returns translation specified in parameter when present' do
      expect(mlstring.to_s(:cs)).to eq 'Foo'
    end

    it 'returns nil when specified language not present' do
      expect(mlstring.to_s(:sk)).to be_nil
    end

    it 'returns translation in default language when language not specified' do
      expect(mlstring.to_s).to eq 'Lorem Ipsum'
    end

    it 'returns first translation when default default language not present' do
      @translations = {cs: 'Foo', sk: 'Bar'}
      expect(mlstring.to_s).to eq 'Foo'
    end

  end

  describe 'default language' do

    it 'can set default language in initialize' do
      str = MLString.new(translations, :cs)
      expect(str.to_s).to eq 'Foo'
    end

  end

end
