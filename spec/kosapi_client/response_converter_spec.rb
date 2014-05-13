require 'spec_helper'

describe KOSapiClient::ResponseConverter do

  subject(:converter) { described_class.new }


  describe '#convert_paginated' do

    let(:items) { [{xsi_type: 'courseEvent', capacity: 70}, {xsi_type: 'courseEvent', capacity: 40}] }

    it 'processes paginated response' do
      result = converter.convert_paginated(items)
      expect(result).to be_an_instance_of(KOSapiClient::Entity::ResultPage)
    end


  end

  describe '#convert_single' do

    let(:item) { {xsi_type: 'courseEvent', capacity: 70} }

    it 'processes non-paginated response' do
      result = converter.convert_single(item)
      expect(result).to be_an_instance_of(KOSapiClient::Entity::CourseEvent)
    end

  end

end
