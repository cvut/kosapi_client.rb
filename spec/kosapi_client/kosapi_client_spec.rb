require 'spec_helper'

describe KOSapiClient do

  before do
    @client = KOSapiClient.configure do |c|
      c.client_id = 'foo'
      c.client_secret = 'bar'
    end
  end

  it 'can be configured via block' do
    expect(@client).not_to be_nil
  end

  it 'delegates missing methods to stored client instance' do
    expect(@client).to receive(:course_events)
    KOSapiClient.course_events
  end

  it 'handles missing methods not defined on client' do
    expect { KOSapiClient.foo }.to raise_error NoMethodError
  end

  it 'throws error when calling client methods with no configured client' do
    KOSapiClient.reset
    expect { KOSapiClient.course_events }.to raise_error(RuntimeError)
  end

  it 'responds to client methods' do
    allow(@client).to receive(:foo)
    expect(KOSapiClient).to respond_to(:foo)
  end

end
