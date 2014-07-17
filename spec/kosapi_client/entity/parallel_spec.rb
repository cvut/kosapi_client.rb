require 'spec_helper'

describe KOSapiClient::Entity::Parallel do
  let(:attributes) { { code: '42',
                       capacity_overfill: 'DENIED',
                       teacher: [{ xlink_href: 'teachers/smitkdan/', __content__: 'Ing. arch. Daniel Smitka Ph.D.' }]
  } }


  it 'parses parallel attributes' do
    parallel = KOSapiClient::Entity::Parallel.parse(attributes)
    expect(parallel.code).to eq 42
    expect(parallel.capacity_overfill).to eq :denied
    expect(parallel.teachers.first).to be_an_instance_of KOSapiClient::Entity::Link
    expect(parallel.teachers.first.href).to eq 'teachers/smitkdan/'
    expect(parallel.teachers.first.title).to eq 'Ing. arch. Daniel Smitka Ph.D.'
  end
end
