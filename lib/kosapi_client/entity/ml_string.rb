module KOSapiClient
  module Entity
    class MLString

      attr_reader :translations

      def initialize(translations)
        @translations = translations
      end

      def to_s(lang = :cs, default = '')
        if @translations.has_key?(lang)
          @translations[lang]
        else
          default
        end
      end

      def self.parse(item)
        unless item.is_a?(Array)
          item = [item]
        end
        translations = {}
        item.each do |it|
          lang = it[:xml_lang].to_sym
          value = it[:__content__]
          translations[lang] = value
        end

        MLString.new(translations)
      end

    end
  end
end
