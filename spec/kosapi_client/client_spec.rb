require 'spec_helper'

describe KOSapiClient::Client, :vcr do
  subject(:client) { KOSapiClient::Client.new(*credentials) }


  context 'invalid OAUTH credentials' do
    let(:credentials) { %w(invalid_client_id invalid_secret) }

    it 'throws error when authenticating' do
      expect { client.authenticate }.to raise_error(OAuth2::Error)
    end

    it 'throws authentication error when fetching resource' do
      expect { client.course_events }.to raise_error(OAuth2::Error)
    end
  end

  context 'valid OAUTH credentials' do
    let(:credentials) { [ENV['KOSAPI_OAUTH_CLIENT_ID'], ENV['KOSAPI_OAUTH_CLIENT_SECRET']] }

    it 'authenticates successfully' do
      expect { client.authenticate }.not_to raise_error
    end

    it 'fetches response from a REST resource' do
      response = client.course_events
      expect(response).not_to be_nil
    end

  end
end
