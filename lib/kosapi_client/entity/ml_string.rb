module KOSapiClient
  module Entity
    class MLString

      DEFAULT_LANGUAGE = :en
      attr_reader :translations

      def initialize(translations, default_language = DEFAULT_LANGUAGE)
        @translations = translations
        @default_language = default_language
      end

      def to_s(lang = :implicit)
        if lang == :implicit
          lang = select_lang
        end
        @translations[lang]
      end

      def self.parse(item, context = {})
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

      private
      def select_lang
        return @default_language if @translations.key?(@default_language)
        @translations.keys.first
      end

    end
  end
end
