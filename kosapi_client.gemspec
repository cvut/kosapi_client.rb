# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kosapi_client/version'

Gem::Specification.new do |spec|
  spec.name          = 'kosapi_client'
  spec.version       = KOSapiClient::VERSION
  spec.authors       = ['Tibor Szolár']
  spec.email         = %w(szolatib@fit.cvut.cz)
  spec.description   = %q{REST client for KOSapi service}
  spec.summary       = %q{Simple Ruby client library for accessing KOSapi service resources}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = %w(lib)

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '3.0.0.beta2'
  spec.add_development_dependency 'rspec-given'
  spec.add_development_dependency 'dotenv'
  spec.add_development_dependency 'vcr'
  spec.add_development_dependency 'codeclimate-test-reporter'

  spec.add_runtime_dependency 'oauth2'
  spec.add_runtime_dependency 'faraday', '~> 0.8.9' # VCR does not work with newer versions yet
  spec.add_runtime_dependency 'activesupport'
  spec.add_runtime_dependency 'escape_utils' unless RUBY_PLATFORM == 'java' # used for uri_template
  spec.add_runtime_dependency 'uri_template'
end
