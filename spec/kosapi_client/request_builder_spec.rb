require 'spec_helper'

describe KOSapiClient::RequestBuilder do

  let(:url_builder) { instance_double(KOSapiClient::URLBuilder, url: 'http://example.com') }
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

    it 'sets path in URL' do
      expect(url_builder).to receive(:set_path)
      builder.find(10)
    end

  end

end
