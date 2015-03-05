require 'spec_helper'

describe KOSapiClient::Entity::ResultPage do

  ResultPage = KOSapiClient::Entity::ResultPage

  let(:links) { KOSapiClient::ResponseLinks.new(nil, next_link) }
  subject(:result_page) { ResultPage.new([item], links) }
  let(:item) { double(:item) }
  let(:item2) { double(:second_item) }
  let(:next_page) { ResultPage.new([item2], KOSapiClient::ResponseLinks.new(nil, nil)) }
  let(:next_link) { link = KOSapiClient::Entity::Link.new(nil, "/", nil, nil) }

  before(:each) do
    next_link.instance_variable_set(:@target, next_page)
  end


  describe '#each' do

    it 'is auto-paginated by default' do

      [item, item2].each { |it| expect(it).to receive(:foo) }
      result_page.each { |it| it.foo }
    end

    context 'with auto-pagination disabled' do

      subject(:result_page) { ResultPage.new([item], links, false) }

      it 'is not auto-paginated' do
        expect(item).to receive(:foo)
        expect(item2).not_to receive(:foo)
        result_page.each { |it| it.foo }
      end
    end

  end

  describe '#count' do

    it 'returns item count' do
      expect(result_page.count).to eq 1
    end

  end

end
