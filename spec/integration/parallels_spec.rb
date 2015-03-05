require 'spec_helper'

describe 'Parallels resource', :vcr, :integration do

  let(:credentials) { { client_id: ENV['KOSAPI_OAUTH_CLIENT_ID'], client_secret: ENV['KOSAPI_OAUTH_CLIENT_SECRET'] } }
  subject(:client) {  KOSapiClient.new(credentials) }

  it 'fetches parallels list' do
    page = client.parallels.offset(0).limit(50).query('course.department' => '18*')
    expect(page.items.count).to eq 50
  end

  it 'parses relationship links properly' do
    page = client.parallels
    course = page.items.first.course
    expect(course.link_title).not_to be_nil
    expect(course.link_href).not_to be_nil
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
    expect(parallel.link.link_href).not_to be_nil
    expect(parallel.link.link_rel).not_to be_nil
  end

  it 'follows reference link properly' do
    teacher = client.parallels.find(339540000).teachers.first

    expect(teacher.username).to eq("balikm")
  end

  it 'parses timetable slot ID' do
    page = client.parallels
    slot = page.items.first.timetable_slots.first
    expect(slot.id).not_to be_nil
  end

  it 'returns following result page with next callback' do
    page = client.parallels
    following_page = page.next
    expect(following_page.items.count).to be > 0
  end

  it 'follows next link with RSQL query' do
    page = client.parallels.where('(lastUpdatedDate>=2014-07-01T00:00:00;lastUpdatedDate<=2014-07-10T00:00:00)')
    expect(page.next.items.count).to be > 0
  end

  it 'returns students for a parallel' do
    students = client.parallels.find(339540000).students.limit(20)
    expect(students.count).to eq 15
  end

end
