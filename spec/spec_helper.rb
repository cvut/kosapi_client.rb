require 'dotenv'
Dotenv.load

if ENV['CODECLIMATE_REPO_TOKEN']
  require 'simplecov'
  SimpleCov.start
end

if ENV['TRAVIS']
  require 'coveralls'
  Coveralls.wear!
end

require 'rspec/given'
require 'kosapi_client'

Dir['./spec/support/**/*.rb'].sort.each { |f| require f }

RSpec.configure do |config|
  #config.treat_symbols_as_metadata_keys_with_true_values = true
  config.extend Helpers
  config.include ClientHelpers
end

require 'vcr'

VCR.configure do |c|
  c.configure_rspec_metadata!
  c.hook_into :faraday
  c.default_cassette_options = {
      #serialize_with: :json,
      # TODO: Track down UTF-8 issue and remove
      #preserve_exact_body_bytes: true,
      #decode_compressed_response: true,
      record: ENV['TRAVIS'] ? :none : :once
  }
  c.cassette_library_dir = 'spec/cassettes'
end

VCR.turn_off! ignore_cassettes: true if ENV['TRAVIS']
