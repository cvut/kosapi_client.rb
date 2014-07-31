require 'spec_helper'

describe KOSapiClient::KOSapiResponse do

  subject(:response) { KOSapiClient::KOSapiResponse.new(result) }
  let(:client) { instance_double(KOSapiClient::HTTPClient) }

  context 'with paginated response' do
    let(:result) { {atom_feed: {atom_entry: [:entry1, :entry2], atom_link: [{rel: 'prev', href: 'courses/?offset=0&limit=10'}, {rel: 'next', href: 'courses/?offset=20&limit=10'}]}} }

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

    describe '#links_hash' do

      it 'extracts links from feed' do
        expect(response.links_hash).to eq [{rel: 'prev', href: 'courses/?offset=0&limit=10'}, {rel: 'next', href: 'courses/?offset=20&limit=10'}]
      end


      context 'with single link' do
        let(:result) { {atom_feed: {atom_link: {rel: 'next', href: 'courses/?offset=10&limit=10'}}} }

        it 'extracts next link from feed' do
          expect(response.links_hash).to eq({rel: 'next', href: 'courses/?offset=10&limit=10'})
        end
      end

      context 'with no links' do
        let(:result) { {atom_feed: {}} }

        it 'returns null' do
          expect(response.links_hash).not_to be
        end
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

    describe '#links_hash' do
      it 'returns null' do
        expect(response.links_hash).not_to be
      end
    end
  end

end
