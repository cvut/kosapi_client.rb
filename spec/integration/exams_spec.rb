require 'spec_helper'

describe 'Exams resource', :vcr, :integration do
  
  subject(:client) { create_kosapi_client }

  it 'fetches exams' do
    expect(client.exams.offset(0).limit(10).count).to be > 0
  end

  it 'fetches exam students' do
    expect(client.exams.find(193156727405).attendees.count).to be > 0
  end

  it 'allows multiple examiners' do
    exam = client.exams.find(613664749005)
    expect(exam.examiners.count).to be 2
    expect(exam.examiners.first.link_id).to eq 'zhoufjar'
  end
end
