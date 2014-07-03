require 'spec_helper'

describe KOSapiClient::Entity::BaseEntity do
  let(:attributes) { {atom_id: 'urn:cvut:kos:courseevent:220200484405',
                      atom_title: 'This is a title',
                      atom_updated: '2010-05-13T09:12:58.0',
                      atom_author: {atom_name: 'pochova'},
                      atom_link: {rel: 'self', href: 'courseEvents/220200484405/'}
  } }


  it 'parses basic attributes' do
    entity = KOSapiClient::Entity::BaseEntity.parse(attributes)

    expect(entity.id).to eq 'urn:cvut:kos:courseevent:220200484405'
    expect(entity.title).to eq 'This is a title'
    expect(entity.link).to be_an_instance_of KOSapiClient::Entity::Link
    expect(entity.author).to be_an_instance_of KOSapiClient::Entity::Author
  end
end
