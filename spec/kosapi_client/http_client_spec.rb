require 'spec_helper'

describe KOSapiClient::HTTPClient do

  let(:response_converter) { instance_double(KOSapiClient::ResponseConverter, process_response: nil) }
  let(:http_adapter) { instance_double(KOSapiClient::OAuth2HttpAdapter) }
  subject(:client) { KOSapiClient::HTTPClient.new(http_adapter, response_converter) }

  describe '#send_request' do

    it 'calls http adapter' do
      expect(http_adapter).to receive(:send_request)
      client.send_request(:get, 'http://example.com')
    end

  end

end
