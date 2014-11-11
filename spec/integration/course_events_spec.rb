require 'spec_helper'

describe 'Course events resource', :vcr, :integration do
  subject(:client) { create_kosapi_client }

  it 'returns course events' do
    expect(client.course_events).not_to be_nil
  end
end
