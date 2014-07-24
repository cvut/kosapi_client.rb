require 'spec_helper'

describe KOSapiClient::HTTPClient do

  let(:response) { double(parsed: {}) }
  let(:http_adapter) { instance_double(KOSapiClient::OAuth2HttpAdapter) }
  let(:preprocessed_hash) { {} }
  let(:preprocessor) { instance_double(KOSapiClient::ResponsePreprocessor, preprocess: preprocessed_hash) }
  let(:converter) { instance_double(KOSapiClient::ResponseConverter, convert: nil) }
  subject(:client) { KOSapiClient::HTTPClient.new(http_adapter, preprocessor, converter) }

  describe '#send_request' do

    it 'calls http adapter' do
      expect(http_adapter).to receive(:send_request).and_return(response)
      client.send_request(:get, 'http://example.com')
    end

  end

  describe '#process_response' do

    it 'converts items with converter' do
      expect(converter).to receive(:convert).and_return(:foo)
      expect(client.process_response(nil)).to eq(:foo)
    end

  end

end
