require 'spec_helper'

describe KOSapiClient::HTTPResponse do
  let(:parsed_result) { {id: 'urn:cvut:kos:courseevent:220200484405'} }
  let(:result) { Object.new.stub(:parsed, parsed_result) }
  subject(:response) { KOSapiClient::HTTPResponse.new(result) }

  it 'provides all items' do

  end
end