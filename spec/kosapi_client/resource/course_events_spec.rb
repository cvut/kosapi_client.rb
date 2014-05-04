require 'spec_helper'

describe 'Course events resource', :vcr do
  let(:credentials) { { client_id: ENV['KOSAPI_OAUTH_CLIENT_ID'], client_secret: ENV['KOSAPI_OAUTH_CLIENT_SECRET'] } }
  subject(:client) {  KOSapiClient.new(credentials) }

  it 'returns course events' do
    expect(client.course_events).not_to be_nil
  end
end
