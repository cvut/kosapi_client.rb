require 'spec_helper'

describe KOSapiClient::ApiClient do
  subject(:client) { KOSapiClient::ApiClient.new(double) }


  it 'responds to api resource methods' do
    expect(client.respond_to? :course_events).to be_true
  end
end