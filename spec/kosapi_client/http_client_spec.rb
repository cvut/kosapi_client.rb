require 'spec_helper'

describe KOSapiClient::HTTPClient do

  let(:response) { instance_double(KOSapiClient::KOSapiResponse, convert: nil) }
  let(:http_adapter) { instance_double(KOSapiClient::OAuth2HttpAdapter) }
  subject(:client) { KOSapiClient::HTTPClient.new(http_adapter) }

  describe '#send_request' do

    it 'calls http adapter' do
      expect(http_adapter).to receive(:send_request).and_return(response)
      client.send_request(:get, 'http://example.com')
    end

  end

end
