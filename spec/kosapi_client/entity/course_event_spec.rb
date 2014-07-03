require 'spec_helper'

describe KOSapiClient::Entity::CourseEvent do
  let('course_event_input') {  {atom_id: 'urn:cvut:kos:courseevent:220200484405',
                                atom_updated: '2010-05-13T09:12:58.0',
                                atom_author: {atom_name: 'pochova'},
                                atom_link: {rel: 'self', xlink_href: 'courseEvents/220200484405/'},
                                capacity: '70',
                                course: {__content__: 'Computer Structure  and Architecture',
                                         xlink_href: 'courses/BI-SAP/'},
                                end_date: '2010-05-18T14:01:00',
                                name: {__content__: 'test1 oprava', lang: 'cs'},
                                occupied: '50',
                                room: {__content__: 'TK:PU1', xlink_href: 'rooms/TK:PU1/'},
                                semester: {__content__: 'Summer 2009/2010', xlink_href: 'semesters/B092/'},
                                signin_deadline: '2010-05-17',
                                start_date: '2010-05-18T14:00:00',
                                type: ['courseEvent', 'xml']} }

  it 'parses provided data' do
    course_event = KOSapiClient::Entity::CourseEvent.parse(course_event_input)
    expect(course_event.capacity).to eq 70
    expect(course_event.course).to be_an_instance_of(KOSapiClient::Entity::Link)
  end

  it 'parses base attributes' do
    course_event = KOSapiClient::Entity::CourseEvent.parse(course_event_input)
    expect(course_event.id).to eq 'urn:cvut:kos:courseevent:220200484405'
  end
end
