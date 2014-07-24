require 'spec_helper'

describe KOSapiClient::ResponsePreprocessor do
  subject(:preprocessor) { KOSapiClient::ResponsePreprocessor.new }
  let(:response) { double(parsed: parsed_response) }
  let(:parsed_response) { {atom_entry: {}, 'sampleKey' => 'value', 'nestedHash' => ['stuff', {'foo'=>'bar'}]} }

  it 'stringifies hash keys and make then snakecase' do
    result = preprocessor.preprocess(response)
    expect(result).to eq({atom_entry: {}, sample_key: 'value', nested_hash: ['stuff', {foo: 'bar'}]})
  end

  it 'converts entries to array when required' do
    resp = {atom_feed: {
        atom_entry: {id: '1234'}
    }}
    result = preprocessor.preprocess(double(parsed: resp))
    expect(result).to eq({atom_feed: {atom_entry: [{id: '1234'}]}})
  end

  it 'merges contents to entries in feed' do
    resp = {atom_feed: {
        atom_entry: [{id: '1234', atom_content: {foo: :bar}}]
    }}
    result = preprocessor.preprocess(double(parsed: resp))
    expect(result).to eq({atom_feed: {atom_entry: [{id: '1234', foo: :bar}]}})
  end

  it 'merges content in single entry' do
    resp = {atom_entry: {id: '1234', atom_content: {foo: :bar}}}
    result = preprocessor.preprocess(double(parsed: resp))
    expect(result).to eq({atom_entry: {id: '1234', foo: :bar}})
  end

  it 'handles empty response' do
    resp = {atom_feed: {} }
    result = preprocessor.preprocess(double(parsed: resp))
    expect(result).to eq({atom_feed: {}})
  end

  context 'with invalid response' do

    let(:parsed_response) { 'foo' }

    it 'raises error when parsed type is not a hash' do
      expect { preprocessor.preprocess(response) }.to raise_error(RuntimeError)
    end

  end

end
