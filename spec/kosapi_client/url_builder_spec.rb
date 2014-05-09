require 'spec_helper'

describe KOSapiClient::URLBuilder do

  subject(:builder) { KOSapiClient::URLBuilder.new('http://example.com') }

  describe '#set_query_param' do

    it 'adds new query parameters to ur' do
      builder.set_query_param('foo', 'bar')
      builder.set_query_param('boo', 'far')
      expect(builder.url).to eq 'http://example.com?foo=bar&boo=far'
    end

    it 'overwrites already used query parameters' do
      builder.set_query_param('foo', 'bar')
      builder.set_query_param('foo', 'far')
      expect(builder.url).to eq 'http://example.com?foo=far'
    end

  end

  describe '#set_path' do

    it 'sets path correctly' do
      builder.set_path('foo', 'bar')
      expect(builder.url).to eq 'http://example.com/foo/bar'
    end

  end

end
