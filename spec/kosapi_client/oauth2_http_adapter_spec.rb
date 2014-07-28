require 'spec_helper'

describe KOSapiClient::OAuth2HttpAdapter, :vcr do
  KOSAPI_ROOT_URL = 'https://kosapi.fit.cvut.cz/api/3/'
  subject(:client) { KOSapiClient::OAuth2HttpAdapter.new(credentials, KOSAPI_ROOT_URL) }


  context 'with invalid OAUTH credentials' do
    let(:credentials) { { client_id: 'invalid_client_id', client_secret: 'invalid_secret' } }

    it 'throws authentication error when fetching resource' do
      expect { client.send_request(:get, 'courses') }.to raise_error(OAuth2::Error)
    end
  end

  context 'with valid OAUTH credentials' do
    let(:credentials) { { client_id: ENV['KOSAPI_OAUTH_CLIENT_ID'], client_secret: ENV['KOSAPI_OAUTH_CLIENT_SECRET'] } }

    it 'fetches response from a REST resource' do
      response = client.send_request(:get, 'courses')
      expect(response).not_to be_nil
    end

  end
end
