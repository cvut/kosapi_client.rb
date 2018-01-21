require 'spec_helper'

describe KOSapiClient::Entity::Branch do
  let(:attributes) {{
    capacity: '60',
    code: '3902R031',
    division: { xlink_href: 'divisions/13136/', __content__: 'katedra počítačů' },
    diploma_name: [
      { xml_lang: 'cs', __content__: 'Softwarové inženýrství' },
      { xml_lang: 'en', __content__: 'Software Engineering' },
    ],
    guarantor: { xlink_href: 'people/jelinek/', __content__: 'doc. Ing. Ivan Jelínek CSc.' },
    name: [
      { xml_lang: 'cs', __content__: 'Softwarové inženýrství' },
      { xml_lang: 'en', __content__: 'Software Engineering' },
    ],
    open_for_admission: 'true',
  }}

  it 'parses branch attributes' do
    branch = KOSapiClient::Entity::Branch.parse(attributes)
    expect(branch.capacity).to eq 60
    expect(branch.code).to eq '3902R031'
    expect(branch.division).to be_an_instance_of KOSapiClient::Entity::Link
    expect(branch.division.link_href).to eq 'divisions/13136/'
    expect(branch.division.link_title).to eq 'katedra počítačů'
    expect(branch.guarantor).to be_an_instance_of KOSapiClient::Entity::Link
    expect(branch.guarantor.link_href).to eq 'people/jelinek/'
    expect(branch.guarantor.link_title).to eq 'doc. Ing. Ivan Jelínek CSc.'
  end
end
