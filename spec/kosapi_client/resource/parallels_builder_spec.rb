require 'spec_helper'

describe KOSapiClient::Resource::ParallelsBuilder do

  let(:url_builder) { instance_double(KOSapiClient::URLBuilder, url: 'http://example.com') }
  let(:response) { double(foo: :bar) }
  let(:http_client) { double(send_request: response) }
  subject(:builder) { KOSapiClient::Resource::ParallelsBuilder.new('http://example.com', http_client, url_builder) }

  describe '#related' do

    it 'throws error when parallel id not set' do
      expect { builder.related }.to raise_error(RuntimeError)
    end

  end
end
