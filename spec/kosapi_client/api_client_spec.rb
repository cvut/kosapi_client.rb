require 'spec_helper'

describe KOSapiClient::ApiClient do
  subject(:client) { KOSapiClient::ApiClient.new(double) }

  it 'responds to api resource methods' do
    expect(client).to respond_to :course_events
  end

  it 'creates default builder when no custom builder is defined' do
    builder = client.create_builder(:foo)
    expect(builder).to be_an_instance_of KOSapiClient::RequestBuilder
  end
end
