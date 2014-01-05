module KOSapiClient
  module Entity
    class MLString
      def self.parse(item)
        czech_string = item.find{ |it| it[:'xml:lang'] == 'cs' }
        czech_string[:__content__] if(czech_string)
      end
    end
  end
end
