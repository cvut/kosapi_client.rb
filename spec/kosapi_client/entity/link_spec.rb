require 'spec_helper'

describe KOSapiClient::Entity::Link do

  Link = KOSapiClient::Entity::Link

  let(:client) { instance_double(KOSapiClient::HTTPClient) }
  subject(:link) { Link.parse({href: 'http://example.com/foo/bar/42', __content__: 'Example Site', rel: 'next'}, {client: client}) }
  let(:result) { double(:result, foo: :bar) }

  describe '.parse' do

    it 'can be parsed from a hash' do
      expect(link.link_href).to eq 'http://example.com/foo/bar/42'
      expect(link.link_title).to eq 'Example Site'
      expect(link.link_rel).to eq 'next'
    end

  end

  describe '#initialize' do

    it 'encodes href URL' do
      href = 'parallels?query=(lastUpdatedDate%3E=2014-07-01T00:00:00;lastUpdatedDate%3C=2014-07-10T00:00:00)&offset=10&limit=10'
      link = Link.new(nil, href, nil, nil)
      expect(link.link_href).to eq 'parallels?query=(lastUpdatedDate%3E=2014-07-01T00:00:00%3BlastUpdatedDate%3C=2014-07-10T00:00:00)&offset=10&limit=10'
    end

  end

  describe '#link_id' do

    it 'returns last href segment' do
      expect(link.link_id).to eq '42'
    end

  end

  describe '#follow' do

    it 'calls http client with href' do
      expect(client).to receive(:send_request).with(:get, 'http://example.com/foo/bar/42')
      link.follow
    end

  end

  describe '#method_missing?' do

    it 'calls follow when method not defined' do
      expect(link).to receive(:follow)
      expect { link.foo }.to raise_error(NoMethodError)
    end

    it 'delegates missing methods to returned object' do
      expect(result).to receive(:foo).and_return(:bar)
      allow(link).to receive(:follow).and_return(result)
      expect(link.foo).to eq :bar
    end

    it 'caches returned object' do
      expect(link).to receive(:follow).once.and_return(result)
      2.times { link.foo }
    end

  end

  describe '#respond_to_missing?' do

    it 'responds to target object methods' do
      allow(link).to receive(:follow).and_return(double(foo: :bar))
      expect(link).to respond_to(:foo)
    end
  end

  describe '#to_hash' do
    it 'converts link attributes to hash' do
      expect(link.to_hash).to eq({href: 'http://example.com/foo/bar/42', title: 'Example Site', rel: 'next'})
    end

  end

end
