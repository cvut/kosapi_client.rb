require 'spec_helper'

describe KOSapiClient::Entity::Parallel do
  let(:attributes) { { code: '42',
                       capacity_overfill: 'DENIED',
                       teacher: [{ xlink_href: 'teachers/smitkdan/', __content__: 'Ing. arch. Daniel Smitka Ph.D.' }]
  } }

  let(:client) { instance_double(KOSapiClient::HTTPClient) }

  it 'parses parallel attributes' do
    parallel = KOSapiClient::Entity::Parallel.parse(attributes, {client: client})
    expect(parallel.code).to eq 42
    expect(parallel.capacity_overfill).to eq :denied
    expect(parallel.teachers).to be_a(Array)
    expect(parallel.teachers.first).to be_instance_of KOSapiClient::Entity::Link

    link_data = parallel.teachers.first.to_hash

    expect(link_data[:href]).to eq 'teachers/smitkdan/'
    expect(link_data[:title]).to eq 'Ing. arch. Daniel Smitka Ph.D.'

  end
end
