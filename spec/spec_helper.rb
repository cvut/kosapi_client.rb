require 'dotenv'
Dotenv.load

require 'rspec/given'
require 'kosapi_client'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
end