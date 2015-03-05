require 'spec_helper'

describe 'Courses resource', :vcr, :integration do
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

  it 'parses empty response' do
    page = client.courses.offset(1000000)
    expect(page.items).to eq []
  end

  describe "#parallels" do
    it 'returns parallels for course in specified semester' do
      parallels = client.courses.find('MI-PAA').sem('B141').parallels.limit(20)
      expect(parallels.count).to eq 9
    end
  end

  describe "#students" do
    it 'returns students of course in specified semester' do
      students = client.courses.find('MI-PAA').sem('B141').students.limit(200)
      expect(students.count).to eq 188
    end
  end

  describe "#instance" do
    it 'returns instance for course in specified semester' do
      instance = client.courses.find('MI-PAA').instance('B141')
      expect(instance).to be_a KOSapiClient::Entity::Coursin
    end
  end
end
