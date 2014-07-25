require 'spec_helper'

describe KOSapiClient::ResponseConverter do

  subject(:converter) { described_class.new }

  describe '#convert' do

    context 'with paginated response' do

      let(:api_response) { double(is_paginated?: true, items: [{xsi_type: 'courseEvent', capacity: 70}, {xsi_type: 'courseEvent', capacity: 40}]) }

      it 'processes paginated response' do
        result = converter.convert(api_response)
        expect(result).to be_an_instance_of(KOSapiClient::Entity::ResultPage)
      end


    end

    context 'with single entry response' do

      let(:api_response) { double(is_paginated?: false, item: {xsi_type: 'courseEvent', capacity: 70}) }

      it 'processes non-paginated response' do
        result = converter.convert(api_response)
        expect(result).to be_an_instance_of(KOSapiClient::Entity::CourseEvent)
      end

    end

  end



end
