require 'spec_helper'

describe KOSapiClient::Entity::AtomFeed do
  Given(:args) { {feed: {
      id: 'https://kosapi.fit.cvut.cz/api/3/courseEvents',
      updated: '2013-11-03T13:38:48.386',
      link: { rel: 'next', href: 'courseEvents?offset=10&limit=10'},
      entry: [],
      startIndex: '0',
      itemsPerPage: '10',
      base: 'https://kosapi.fit.cvut.cz/api/3/',
      lang: 'en'
  }} }



  context 'when creating new feed' do
    When(:feed) { KOSapiClient::Entity::AtomFeed.new(args) }
    Then { feed != nil }
  end

  context 'when accessing feed attributes' do
    Given(:feed) { KOSapiClient::Entity::AtomFeed.new(args) }

    context 'reading ID' do
      When(:id) { feed.id }
      Then { id == 'https://kosapi.fit.cvut.cz/api/3/courseEvents' }
    end



  end


end