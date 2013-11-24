require 'spec_helper'

describe KOSapiClient::ResponsePreprocessor do
  subject(:preprocessor) { KOSapiClient::ResponsePreprocessor.new }
  let(:response) { {'sampleKey' => 'value', 'nestedHash' => ['stuff', {'foo'=>'bar'}]} }

  it 'stringify hash keys and make then snakecase' do
    result = preprocessor.preprocess(response)

    expect(result).to eq({sample_key: 'value', nested_hash: ['stuff', {foo: 'bar'}]})
  end
end