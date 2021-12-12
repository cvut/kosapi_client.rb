require 'spec_helper'

describe KOSapiClient::ResponseConverter do

  let(:client) { instance_double(KOSapiClient::HTTPClient) }
  subject(:converter) { described_class.new }
  let(:converter_context) { {client: client} }

  describe '#convert' do

    context 'with paginated response' do

      let(:prev_link) { instance_double(KOSapiClient::Entity::Link) }
      let(:next_link) { instance_double(KOSapiClient::Entity::Link) }
      let(:links) { KOSapiClient::ResponseLinks.new(prev_link, next_link) }

      let(:api_response) { double(is_paginated?: true, items: [{xsi_type: 'courseEvent', capacity: 70}, {xsi_type: 'courseEvent', capacity: 40}], links_hash: links) }

      before(:each) { allow(converter).to receive(:create_links).and_return(links) }

      it 'processes paginated response' do
        result = converter.convert(api_response, converter_context)
        expect(result).to be_an_instance_of(KOSapiClient::Entity::ResultPage)
      end

      it 'creates next link' do
        result = converter.convert(api_response, converter_context)
        expect(result.next).to be next_link
      end

      it 'creates prev link' do
        result = converter.convert(api_response, converter_context)
        expect(result.prev).to be prev_link
      end
    end

    context 'with single entry response' do

      let(:api_response) { double(is_paginated?: false, item: {xsi_type: 'courseEvent', capacity: 70}) }

      it 'processes non-paginated response' do
        result = converter.convert(api_response, converter_context)
        expect(result).to be_an_instance_of(KOSapiClient::Entity::CourseEvent)
      end

    end

    context 'unknown type' do

      let(:api_response) { double(is_paginated?: false, item: {xsi_type: 'unknownType'}) }

      it 'raises error when type not found' do
        expect { converter.convert(api_response, converter_context) }.to raise_error(RuntimeError)
      end

    end

  end

end
