require 'spec_helper'

describe KOSapiClient::Entity::TimetableSlot do

  TimetableSlot = KOSapiClient::Entity::TimetableSlot

  describe '.parse' do

    it 'can be parsed from a hash' do
      slot = TimetableSlot.parse({id: '42', day: '1', first_hour: '3', duration: '2', parity: 'BOTH', room: { __contents__: 'no-title', xlink_href: 'rooms/10010205/' }})
      expect(slot.id).to eq 42
      expect(slot.day).to eq 1
      expect(slot.first_hour).to eq 3
      expect(slot.duration).to eq 2
      expect(slot.parity).to eq :both
      expect(slot.room).to be_an_instance_of(Link)
      expect(slot.room.link_href).to eq 'rooms/10010205/'
    end

  end

end
