require 'spec_helper'

describe KOSapiClient::RequestBuilder do

  let(:response) { double(foo: :bar) }
  let(:http_client) { double(send_request: response) }
  subject(:builder) { KOSapiClient::RequestBuilder.new('http://example.com', http_client) }

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

end
