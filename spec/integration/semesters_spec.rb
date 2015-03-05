require 'spec_helper'

describe 'Semesters resource', :vcr, :integration do

  let(:credentials) { { client_id: ENV['KOSAPI_OAUTH_CLIENT_ID'], client_secret: ENV['KOSAPI_OAUTH_CLIENT_SECRET'] } }
  subject(:client) {  KOSapiClient.new(credentials) }

  it 'fetches semesters list' do
    page = client.semesters.offset(0).limit(2)
    expect(page.items.count).to eq 2
  end

  it 'parses entry ID properly' do
    page = client.semesters
    semester = page.items.first
    expect(semester.id).not_to be_nil
  end

  it 'parses updated properly' do
    page = client.semesters
    semester = page.items.first
    expect(semester.updated).not_to be_nil
  end

  it 'parses author properly' do
    page = client.semesters
    semester = page.items.first
    expect(semester.author.name).not_to be_nil
  end

  it 'parses entry link properly' do
    page = client.semesters
    semester = page.items.first
    expect(semester.link).not_to be_nil
    expect(semester.link.link_href).not_to be_nil
    expect(semester.link.link_rel).not_to be_nil
  end

  it 'fetches current semester' do
    semester = client.semesters.current
    expect(semester.start_date).not_to be_nil
    expect(semester.end_date).not_to be_nil

    expect(Time.new).to be_between(semester.start_date, semester.end_date)
  end
end
