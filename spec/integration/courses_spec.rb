require 'spec_helper'

describe 'Courses resource', :vcr do
  let(:credentials) { { client_id: ENV['KOSAPI_OAUTH_CLIENT_ID'], client_secret: ENV['KOSAPI_OAUTH_CLIENT_SECRET'] } }
  subject(:client) {  KOSapiClient.new(credentials) }


  it 'downloads courses data' do
    page = client.courses.offset(0).limit(15).query(department: '18*')
    expect(page.items.count).to eq 15
  end

  it 'provides courses data details' do
    page = client.courses.offset(20).query(department: '18*').detail
    expect(page.items.last.description).not_to be_nil
  end

  it 'parses entry title' do
    page = client.courses
    expect(page.items.first.title).not_to be_nil
  end


end
