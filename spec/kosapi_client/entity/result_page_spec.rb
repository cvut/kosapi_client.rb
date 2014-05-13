require 'spec_helper'

describe KOSapiClient::Entity::ResultPage do

  ResultPage = KOSapiClient::Entity::ResultPage

  let(:item) { double }
  let(:items) { [item] }
  let(:called) { double(foo: :bar) }
  let(:callback) { Proc.new { called.foo } }
  subject(:result_page) { ResultPage.new(items, 10, callback) }

  describe '#each' do

    it 'iterates over all items' do
      expect(item).to receive(:foo)
      result_page.each { |it| it.foo }
    end

  end

  describe '#count' do

    it 'returns item count' do
      expect(result_page.count).to eq 1
    end

  end

  describe '#next' do

    it 'calls next callback when set' do
      expect(called).to receive(:foo)
      expect(result_page.next).to eq :bar
    end

  end

end
