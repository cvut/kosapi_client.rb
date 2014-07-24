require 'spec_helper'

describe KOSapiClient::KOSapiResponse do

  subject(:response) { KOSapiClient::KOSapiResponse.new(result) }

  context 'with paginated response' do
    let(:result) { {atom_feed: {atom_entry: [:entry1, :entry2]}} }

    describe '#is_paginated?' do

      it 'returns true when result contains atom feed' do
        expect(response.is_paginated?).to be
      end

    end

    describe '#items' do

      it 'returns all entries' do
        expect(response.items).to eq [:entry1, :entry2]
      end

    end

    describe '#item' do

      it 'returns first entry' do
        expect(response.item).to eq :entry1
      end

    end

  end

  context 'with not-paginated response' do
    let(:result) { { atom_entry: :entry} }

    describe '#is_paginated?' do

      it 'returns false when result contains atom feed' do
        expect(response.is_paginated?).not_to be
      end

    end

    describe '#items' do

      it 'returns single entry wrapped in array' do
        expect(response.items).to eq [:entry]
      end

    end

    describe '#item' do

      it 'returns first entry' do
        expect(response.item).to eq :entry
      end

    end
  end

end
