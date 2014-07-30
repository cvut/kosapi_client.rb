require 'spec_helper'

describe KOSapiClient::Entity::Link do

  Link = KOSapiClient::Entity::Link

  subject(:link) { Link.parse({href: 'http://example.com/foo/bar/42', __content__: 'Example Site', rel: 'next'}) }

  describe '.parse' do

    it 'can be parsed from a hash' do
      expect(link.href).to eq 'http://example.com/foo/bar/42'
      expect(link.title).to eq 'Example Site'
      expect(link.rel).to eq 'next'
    end

  end

  describe '#id' do

    it 'returns last href segment' do
      expect(link.id).to eq '42'
    end

  end

  describe '#follow' do

    let(:client) { instance_double(KOSapiClient::HTTPClient)}

    it 'throws error when not http client set' do
      expect { link.follow }.to raise_error(RuntimeError)
    end

    it 'calls http client with href' do
      link.inject_client(client)
      expect(client).to receive(:send_request).with(:get, 'http://example.com/foo/bar/42')
      link.follow
    end

  end

end
