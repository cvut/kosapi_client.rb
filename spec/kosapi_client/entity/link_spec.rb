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

end
