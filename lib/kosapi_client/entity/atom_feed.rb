module KOSapiClient
  module Entity
    class AtomFeed < BaseEntity
      data_reader :id
      data_reader :updated
      data_reader :link
      data_reader :start_index, src: :startIndex
      data_reader :items_per_page, src: :itemsPerPage
      data_reader :base
      data_reader :lang
    end
  end
end

