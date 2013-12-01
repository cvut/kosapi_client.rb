require 'spec_helper'

describe KOSapiClient::Entity::BaseEntity do
  let(:attributes) { {id: 'urn:cvut:kos:courseevent:220200484405',
                      updated: '2010-05-13T09:12:58.0',
                      author: {name: 'pochova'},
                      link: {rel: 'self', href: 'courseEvents/220200484405/'}
  } }


  it 'parses basic attributes' do
    entity = KOSapiClient::Entity::BaseEntity.parse(attributes)

    expect(entity.id).to eq 'urn:cvut:kos:courseevent:220200484405'
    expect(entity.link).to be_an_instance_of KOSapiClient::Entity::Link
    expect(entity.author).to be_an_instance_of KOSapiClient::Entity::Author
  end
end