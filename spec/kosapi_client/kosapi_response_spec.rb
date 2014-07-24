require 'spec_helper'

describe KOSapiClient::KOSapiResponse do
  let(:parsed_result) { {id: 'urn:cvut:kos:courseevent:220200484405'} }
  let(:result) { double(parsed: parsed_result) }
  let(:preprocessed_hash) { {} }
  let(:preprocessor) { instance_double(KOSapiClient::ResponsePreprocessor, preprocess: preprocessed_hash) }
  let(:converter) { instance_double(KOSapiClient::ResponseConverter) }
  subject(:response) { KOSapiClient::KOSapiResponse.new(result) }



end
