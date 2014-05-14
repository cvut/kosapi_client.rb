require 'rspec'

describe 'Parallels resource', :vcr do

  let(:credentials) { { client_id: ENV['KOSAPI_OAUTH_CLIENT_ID'], client_secret: ENV['KOSAPI_OAUTH_CLIENT_SECRET'] } }
  subject(:client) {  KOSapiClient.new(credentials) }

  it 'fetches parallels list' do
    page = client.parallels.offset(0).limit(50).query('course.department' => '18*')
    expect(page.items.count).to eq 50
  end

end
