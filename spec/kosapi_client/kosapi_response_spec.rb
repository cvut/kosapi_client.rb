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

    describe '#next_link' do

      it 'parses next link from feed' do
        link = response.next_link(client)
        expect(link.href).to eq 'courses/?offset=20&limit=10'
        expect(link.rel).to eq 'next'
      end

      it 'injects http client' do
        link = response.next_link(client)
        expect(client).to receive(:send_request)
        link.follow
      end

      context 'with single link' do
        let(:result) { {atom_feed: {atom_link: {rel: 'next', href: 'courses/?offset=10&limit=10'}}} }

        it 'parses next link from feed' do
          link = response.next_link(client)
          expect(link.href).to eq 'courses/?offset=10&limit=10'
          expect(link.rel).to eq 'next'
        end
      end

      context 'with no links' do
        let(:result) { {atom_feed: {}} }

        it 'returns null' do
          expect(response.next_link(client)).not_to be
        end
      end

      context 'with only prev link' do
        let(:result) { {atom_feed: {atom_link: {rel: 'prev', href: 'courses/?offset=10&limit=10'}}} }

        it 'returns null' do
          expect(response.next_link(client)).not_to be
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
  end

end
