require 'spec_helper'

describe KOSapiClient::RequestBuilder do

  let(:response) { double(foo: :bar) }
  subject(:builder) { KOSapiClient::RequestBuilder.new('http://example.com', double(send_request: response)) }

  it 'delegates missing methods to response' do
    expect(response).to receive(:foo)
    builder.foo
  end
end
