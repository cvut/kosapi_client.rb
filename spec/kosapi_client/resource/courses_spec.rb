require 'spec_helper'

describe KOSapiClient, :vcr do
  let(:credentials) { { client_id: ENV['KOSAPI_OAUTH_CLIENT_ID'], client_secret: ENV['KOSAPI_OAUTH_CLIENT_SECRET'] } }
  subject(:client) {  KOSapiClient.new(credentials) }


  it 'downloads courses data' do
    page = client.courses(detail: 1, offset: 0, limit: 50, query: 'department=18*')
    expect(page.items.count).to eq 50
  end

  it 'provides courses data details' do
    page = client.courses(detail: 1, offset: 0, limit: 50, query: 'department=18*')
    expect(page.items.last.description).not_to be_nil
  end


end