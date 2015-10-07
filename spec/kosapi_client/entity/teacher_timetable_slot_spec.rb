require 'spec_helper'

describe KOSapiClient::Entity::TeacherTimetableSlot do

  describe '.parse' do

    it 'can be parsed from a hash' do
      slot = described_class.parse({
        id: '42', day: '1', first_hour: '3', duration: '2', parity: 'BOTH', title: 'Sleep'
      })
      expect(slot.id).to eq 42
      expect(slot.day).to eq 1
      expect(slot.first_hour).to eq 3
      expect(slot.duration).to eq 2
      expect(slot.parity).to eq :both
      expect(slot.title).to eq 'Sleep'
    end
  end
end
