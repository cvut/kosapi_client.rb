require 'spec_helper'

describe KOSapiClient::Entity::Link do

  Link = KOSapiClient::Entity::Link

  let(:client) { instance_double(KOSapiClient::HTTPClient) }
  subject(:link) { Link.parse({href: 'http://example.com/foo/bar/42', __content__: 'Example Site', rel: 'next'}) }
  let(:result) { double(:result, foo: :bar) }
  before(:example) { link.inject_client(client) }

  describe '.parse' do

    it 'can be parsed from a hash' do
      expect(link.link_href).to eq 'http://example.com/foo/bar/42'
      expect(link.link_title).to eq 'Example Site'
      expect(link.link_rel).to eq 'next'
    end

  end

  describe '#id' do

    it 'returns last href segment' do
      expect(link.link_id).to eq '42'
    end

  end

  describe '#follow' do

    it 'throws error when not http client set' do
      link.inject_client(nil)
      expect { link.follow }.to raise_error(RuntimeError)
    end

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

end
