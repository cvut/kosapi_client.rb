require 'dotenv'
Dotenv.load

if ENV['CODECLIMATE_REPO_TOKEN']
  require 'codeclimate-test-reporter'
  CodeClimate::TestReporter.start
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
