require 'spec_helper'

describe KOSapiClient::RequestBuilder do

  let(:url_builder) { instance_double(KOSapiClient::URLBuilder, url: 'http://example.com', set_path: nil, set_query_param: nil) }
  let(:response) { double(foo: :bar) }
  let(:http_client) { double(send_request: response) }
  subject(:builder) { KOSapiClient::RequestBuilder.new('http://example.com', http_client, url_builder) }



  describe '#finalize' do

    it 'sends http request' do
      expect(http_client).to receive(:send_request)
      builder.finalize
    end

    it 'stores response' do
      builder.finalize
      expect(builder.response).to eq response
    end

  end

  describe '#find' do

    it_behaves_like 'fluent api command', method_name, 10

    it 'sets path in URL' do
      expect(url_builder).to receive(:set_path).with(10)
      builder.find(10)
    end

  end

  describe '#offset' do

    it_behaves_like 'fluent api command', method_name, 10

    it 'sets query param' do
      expect(url_builder).to receive(:set_query_param).with(:offset, 10)
      builder.offset(10)
    end

  end

  describe '#limit' do

    it_behaves_like 'fluent api command', method_name, 10

    it 'sets query param' do
      expect(url_builder).to receive(:set_query_param).with(:limit, 10)
      builder.limit(10)
    end

  end

  describe '#query' do

    it_behaves_like 'fluent api command', method_name, foo: 10

    it 'sets query param' do
      expect(url_builder).to receive(:set_query_param).with(:query, 'foo==10;bar==20')
      builder.query(foo: 10, bar: 20)
    end

    it 'throws error when params are empty' do
      expect { builder.query({}) }.to raise_error(RuntimeError)
    end

    it 'accepts string instead of a hash' do
      expect(url_builder).to receive(:set_query_param).with(:query, 'foo==10;bar==20')
      builder.query('foo==10;bar==20')
    end

  end


end
