require 'spec_helper'

describe KOSapiClient::RequestBuilderDelegator do

  it 'delegates known methods to RequestBuilder'
  it 'when unknown method is called on RequestBuilder, it evaluates RequestBuilder'
  it 'when RequestBuilder is evaluated, it delegates all methods to response'


end
