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

  it 'creates custom builder for resource when defined' do
    class KOSapiClient::Resource::FooBarBuilder < KOSapiClient::RequestBuilder; end

    builder = client.create_builder(:foo_bar)
    expect(builder).to be_an_instance_of KOSapiClient::Resource::FooBarBuilder
  end

end
