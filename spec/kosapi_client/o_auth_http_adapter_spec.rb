require 'spec_helper'

describe KOSapiClient::OAuthHttpAdapter, :vcr do
  KOSAPI_ROOT_URL = 'https://kosapi.fit.cvut.cz/api/3/'
  subject(:client) { KOSapiClient::OAuthHttpAdapter.new(credentials, KOSAPI_ROOT_URL) }


  context 'invalid OAUTH credentials' do
    let(:credentials) { { client_id: 'invalid_client_id', client_secret: 'invalid_secret' } }

    it 'throws authentication error when fetching resource' do
      expect { client.get('courses') }.to raise_error(OAuth2::Error)
    end
  end

  context 'valid OAUTH credentials' do
    let(:credentials) { { client_id: ENV['KOSAPI_OAUTH_CLIENT_ID'], client_secret: ENV['KOSAPI_OAUTH_CLIENT_SECRET'] } }

    it 'fetches response from a REST resource' do
      response = client.get('courses')
      expect(response).not_to be_nil
    end

  end
end
