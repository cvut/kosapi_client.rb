module KOSapiClient
  module Entity
    class AtomFeed < BaseEntity
      def id
        attrs[:feed][:id]
      end



    end
  end
end

