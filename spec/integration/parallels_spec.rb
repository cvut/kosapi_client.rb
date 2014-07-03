require 'spec_helper'

describe 'Parallels resource', :vcr do

  let(:credentials) { { client_id: ENV['KOSAPI_OAUTH_CLIENT_ID'], client_secret: ENV['KOSAPI_OAUTH_CLIENT_SECRET'] } }
  subject(:client) {  KOSapiClient.new(credentials) }

  it 'fetches parallels list' do
    page = client.parallels.offset(0).limit(50).query('course.department' => '18*')
    expect(page.items.count).to eq 50
  end

  it 'parses relationship links properly' do
    page = client.parallels
    course = page.items.first.course
    expect(course.title).not_to be_nil
    expect(course.href).not_to be_nil
  end

  it 'parses entry ID properly' do
    page = client.parallels
    parallel = page.items.first
    expect(parallel.id).not_to be_nil
  end

  it 'parses updated properly' do
    page = client.parallels
    parallel = page.items.first
    expect(parallel.updated).not_to be_nil
  end

  it 'parses author properly' do
    page = client.parallels
    parallel = page.items.first
    expect(parallel.author.name).not_to be_nil
  end

  it 'parses entry link properly' do
    page = client.parallels
    parallel = page.items.first
    expect(parallel.link).not_to be_nil
    expect(parallel.link.href).not_to be_nil
    expect(parallel.link.rel).not_to be_nil
  end

end
