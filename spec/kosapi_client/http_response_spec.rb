require 'spec_helper'

describe KOSapiClient::HTTPResponse do
  let(:parsed_result) { {id: 'urn:cvut:kos:courseevent:220200484405'} }
  let(:result) { double(parsed: parsed_result) }
  let(:preprocessed_hash) { {} }
  let(:preprocessor) { instance_double(KOSapiClient::ResponsePreprocessor, preprocess: preprocessed_hash) }
  let(:converter) { instance_double(KOSapiClient::ResponseConverter) }
  subject(:response) { KOSapiClient::HTTPResponse.new(result, preprocessor, converter) }

  describe '#convert' do

    context 'with multiple items' do

      let(:preprocessed_hash) { {atom_feed: {atom_entry: [foo: 1]}} }

      it 'converts items with converter' do
        expect(converter).to receive(:convert_paginated).and_return(:foo)
        expect(response.convert).to eq(:foo)
      end

    end

    context 'with single item' do

      let(:preprocessed_hash) { {atom_entry: [foo: 1]} }

      it 'converts single item with converter' do
        expect(converter).to receive(:convert_single).and_return(:foo)
        expect(response.convert).to eq(:foo)
      end

    end

    context 'with invalid response' do

      let(:parsed_result) { 'foo' }

      it 'raises error when parsed type is not a hash' do
        expect { response.convert }.to raise_error(RuntimeError)
      end

    end


  end

end
