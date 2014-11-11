require 'spec_helper'

describe 'Exams resource', :vcr, :integration do
  
  subject(:client) { create_kosapi_client }

  it 'fetches exams' do
    expect(client.exams.offset(0).limit(10).count).to be > 0
  end

  it 'fetches exam students' do
    expect(client.exams.find(193156727405).attendees.count).to be > 0
  end

end