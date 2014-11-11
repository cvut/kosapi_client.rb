require 'spec_helper'

describe 'Course events resource', :vcr, :integration do
  subject(:client) { create_kosapi_client }

  it 'returns course events' do
    expect(client.course_events.offset(0).limit(10).count).to be 10
  end

  it 'returns course event attendees' do
    expect(client.course_events.find(220200484405).attendees.count).to be > 0
  end
end
