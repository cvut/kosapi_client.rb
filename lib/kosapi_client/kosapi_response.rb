module KOSapiClient
  class KOSapiResponse

    attr_reader :contents

    def initialize(contents)
      @contents = contents
    end

    def is_paginated?
      contents[:atom_feed]
    end

    def items
      if is_paginated?
        contents[:atom_feed][:atom_entry]
      else
        [contents[:atom_entry]]
      end
    end

    def item
      items.first
    end

    def next_link(client)
      link_hash = extract_link('next')
      if link_hash
        link = Entity::Link.parse(link_hash)
        link.inject_client(client)
        link
      end
    end

    private
    def extract_link(rel)
      links_hash = contents[:atom_feed][:atom_link]
      return nil unless links_hash
      links_hash = [links_hash] unless links_hash.instance_of?(Array)
      links_hash.find { |it| it[:rel] == rel }
    end

  end
end
