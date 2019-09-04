require 'spec_helper'

describe KOSapiClient::Configuration do

  subject(:configuration) { KOSapiClient::Configuration.new }

  it 'stores client_id' do
    configuration.client_id = 'foo'
    expect(configuration.client_id).to eq 'foo'
  end

  it 'stores client_secret' do
    configuration.client_secret = 'bar'
    expect(configuration.client_secret).to eq 'bar'
  end

  it 'stores token_url' do
    configuration.token_url = 'baz'
    expect(configuration.token_url).to eq 'baz'
  end

  it 'stores auth_url' do
    configuration.auth_url = 'qux'
    expect(configuration.auth_url).to eq 'qux'
  end

  describe '#credentials' do

    it 'returns OAUTH credentials when set' do
      configuration.client_id = 'foo'
      configuration.client_secret = 'bar'
      expect(configuration.credentials).to eq({client_id: 'foo', client_secret: 'bar'})
    end

    it 'returns empty hash when no credentials set' do
      expect(configuration.credentials).to eq({})
    end

  end
end
