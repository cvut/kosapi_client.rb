require 'spec_helper'

describe KOSapiClient::Entity::TimetableSlot do

  TimetableSlot = KOSapiClient::Entity::TimetableSlot

  describe '.parse' do

    it 'can be parsed from a hash' do
      slot = TimetableSlot.parse({day: :monday, parity: :odd, room: 'A:1324'})
      expect(slot.day).to eq :monday
      expect(slot.parity).to eq :odd
      expect(slot.room).to eq 'A:1324'
    end

  end

end
