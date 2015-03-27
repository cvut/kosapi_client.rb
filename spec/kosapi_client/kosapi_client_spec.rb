require 'spec_helper'

describe KOSapiClient do

  before do
    KOSapiClient.configure do |c|
      c.client_id = 'foo'
      c.client_secret = 'bar'
    end
    @client = KOSapiClient.client
  end

  describe '.configure' do

    it 'can be configured via block' do
      expect(@client).not_to be_nil
    end

  end

  describe '.reset' do

    it 'cleans stored ApiClient instance' do
      KOSapiClient.reset
      expect(KOSapiClient.client).not_to be @client
    end

  end

  describe '.client' do

    it 'provides client instance via reader' do
      expect(KOSapiClient.client).to eq @client
    end

  end

  it 'delegates missing methods to stored client instance' do
    expect(@client).to receive(:course_events)
    KOSapiClient.course_events
  end

  it 'handles missing methods not defined on client' do
    expect { KOSapiClient.foo }.to raise_error NoMethodError
  end

  it 'throws error when sending request with no configured credentials' do
    KOSapiClient.reset
    expect { KOSapiClient.course_events.items }.to raise_error(RuntimeError)
  end

  it 'responds to client methods' do
    allow(@client).to receive(:foo)
    expect(KOSapiClient).to respond_to(:foo)
  end

end
