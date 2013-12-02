require 'spec_helper'

describe KOSapiClient::ResponsePreprocessor do
  subject(:preprocessor) { KOSapiClient::ResponsePreprocessor.new }
  let(:response) { {entry: {}, 'sampleKey' => 'value', 'nestedHash' => ['stuff', {'foo'=>'bar'}]} }

  it 'stringifies hash keys and make then snakecase' do
    result = preprocessor.preprocess(response)
    expect(result).to eq({entry: {}, sample_key: 'value', nested_hash: ['stuff', {foo: 'bar'}]})
  end

  it 'converts entries to array when required' do
    resp = {feed: {
        entry: {id: '1234'}
    }}
    result = preprocessor.preprocess(resp)
    expect(result).to eq({feed: {entry: [{id: '1234'}]}})
  end

  it 'merges contents to entries in feed' do
    resp = {feed: {
        entry: [{id: '1234', content: {foo: :bar}}]
    }}
    result = preprocessor.preprocess(resp)
    expect(result).to eq({feed: {entry: [{id: '1234', foo: :bar}]}})
  end

  it 'merges content in single entry' do
    resp = {entry: {id: '1234', content: {foo: :bar}}}
    result = preprocessor.preprocess(resp)
    expect(result).to eq({entry: {id: '1234', foo: :bar}})
  end

end