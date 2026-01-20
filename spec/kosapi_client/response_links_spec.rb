require 'spec_helper'

describe KOSapiClient::ResponseLinks do

  subject(:links) { described_class.new }
  let(:client) { instance_double(KOSapiClient::HTTPClient) }
  let(:parse_context) { {client: client}}

  describe '.parse' do

    context 'with no links' do
      it 'returns instance with no links set' do
        links = described_class.parse(nil, parse_context)
        expect(links.next).not_to be
        expect(links.prev).not_to be
      end
    end

    context 'with both links' do
      it 'parses both links' do
        links = described_class.parse([{rel: 'prev', href: 'courses/?offset=0&limit=10'}, {rel: 'next', href: 'courses/?offset=20&limit=10'}], parse_context)
        expect(links.next.link_href).to eq 'courses/?offset=20&limit=10'
        expect(links.prev.link_href).to eq 'courses/?offset=0&limit=10'
      end
    end

    context 'with next link' do
      it 'parses next link' do
        links = described_class.parse({rel: 'next', href: 'courses/?offset=20&limit=10'}, parse_context)
        expect(links.next.link_href).to eq 'courses/?offset=20&limit=10'
        expect(links.next.link_rel).to eq 'next'
        expect(links.prev).not_to be
      end
    end

    context 'with prev link' do
      it 'parses prev link' do
        links = described_class.parse({rel: 'prev', href: 'courses/?offset=20&limit=10'}, parse_context)
        expect(links.next).not_to be
        expect(links.prev.link_href).to eq 'courses/?offset=20&limit=10'
        expect(links.prev.link_rel).to eq 'prev'
      end
    end

    it 'injects http client' do
      links = described_class.parse({rel: 'next', href: 'courses/?offset=20&limit=10'}, parse_context)
      expect(client).to receive(:send_request)
      links.next.follow
    end

  end

end
