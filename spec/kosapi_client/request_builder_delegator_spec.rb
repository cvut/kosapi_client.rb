require 'spec_helper'

describe KOSapiClient::RequestBuilderDelegator do

  let(:response) { double(:response) }
  let(:builder) { double(:builder, response: response) }
  subject(:delegator) { KOSapiClient::RequestBuilderDelegator.new(builder) }

  it 'delegates methods which builder responds to, to the builder' do
    expect(builder).to receive(:foo)
    delegator.foo
  end

  it 'evaluates RequestBuilder, when RequestBuilder doesn"t respond to a delegated method' do
    expect(builder).to receive(:finalize)
    expect(response).to receive(:bar)
    delegator.bar
  end

  it 'when RequestBuilder is evaluated, it delegates all methods to response'


end
