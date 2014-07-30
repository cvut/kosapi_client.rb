require 'spec_helper'

describe KOSapiClient::Entity::Id do

  describe '.parse' do

    it 'parses id from string' do
      id = described_class.parse('urn:cvut:kos:parallel:10160605')
      expect(id).to eq '10160605'
    end
  end

end
