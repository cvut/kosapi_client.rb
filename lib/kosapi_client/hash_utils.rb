module KOSapiClient
  module HashUtils

    def self.symbolize_keys(attrs)
      deep_transform_hash_keys(attrs) { |key| key.to_sym rescue key }
    end

    def self.deep_transform_hash_keys(item, &block)
      return item unless item.is_a?(Hash)
      copy = {}
      item.each do |key, value|
        new_value = deep_transform_hash_keys(value, &block) if value.is_a? Hash
        new_value = value.map { |it| deep_transform_hash_keys(it, &block) }  if value.is_a? Array
        new_value ||= value
        copy[block.call(key)] = new_value
      end
      copy
    end

  end
end
