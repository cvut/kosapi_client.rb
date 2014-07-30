require 'spec_helper'

describe KOSapiClient::URLBuilder do

  let(:root) { 'http://example.com' }
  subject(:builder) { KOSapiClient::URLBuilder.new(root) }

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

    context 'with custom root' do

      let(:root) { 'https://kosapi.fit.cvut.cz/api/3' }

      it 'creates correct path' do
        builder.set_path('bar')
        expect(builder.url).to eq 'https://kosapi.fit.cvut.cz/api/3/bar'
      end

    end

  end

end
