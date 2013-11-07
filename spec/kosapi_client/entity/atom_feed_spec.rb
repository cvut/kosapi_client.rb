require 'spec_helper'

describe KOSapiClient::Entity::AtomFeed do
  let(:args) { {feed: {
      id: 'https://kosapi.fit.cvut.cz/api/3/courseEvents',
      updated: '2013-11-03T13:38:48.386',
      link: { rel: 'next', href: 'courseEvents?offset=10&limit=10' },
      entry: [],
      startIndex: '0',
      itemsPerPage: '10',
      base: 'https://kosapi.fit.cvut.cz/api/3/',
      lang: 'en',
  }} }

  it 'creates new feed from args' do
    feed = KOSapiClient::Entity::AtomFeed.new(args)
    expect(feed).not_to be_nil
  end

  context 'when reading feed attributes' do
    subject(:feed) { KOSapiClient::Entity::AtomFeed.new(args) }

    {
        id: 'https://kosapi.fit.cvut.cz/api/3/courseEvents',
        updated: '2013-11-03T13:38:48.386',
        start_index: 0,
        items_per_page: 10,
        base: 'https://kosapi.fit.cvut.cz/api/3/',
        lang: 'en',

    }.each do |attribute, value|
      xit "attribute #{attribute} can be accessed by reader method" do
        expect(feed.send(attribute)).to eq value
      end
    end

  end


end