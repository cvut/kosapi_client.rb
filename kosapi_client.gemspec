# coding: utf-8
require File.expand_path('../lib/kosapi_client/version', __FILE__)

Gem::Specification.new do |spec|
  spec.name          = 'kosapi_client'
  spec.version       = KOSapiClient::VERSION
  spec.authors       = ['Tibor Szolár']
  spec.email         = 'szolatib@fit.cvut.cz'
  spec.description   = 'REST client for KOSapi service'
  spec.summary       = 'Simple Ruby client library for accessing KOSapi service resources'
  spec.homepage      = 'https://github.com/cvut/kosapi_client.rb'
  spec.license       = 'MIT'

  spec.files         = Dir['lib/**/*', '*.gemspec', 'LICENSE', 'README*']
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.0.0'

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rspec-given'
  spec.add_development_dependency 'dotenv'
  spec.add_development_dependency 'vcr', '~> 3.0'
  spec.add_development_dependency 'codeclimate-test-reporter', '~> 1.0.0'
  spec.add_development_dependency 'guard-rspec'
  spec.add_development_dependency 'coveralls'
  spec.add_development_dependency 'fuubar', '~> 2.2.0'
  spec.add_development_dependency 'simplecov'

  spec.add_runtime_dependency 'oauth2', '~> 1.4'
  spec.add_runtime_dependency 'faraday', '~> 0.9'
  spec.add_runtime_dependency 'corefines', '~> 1.6'
  spec.add_runtime_dependency 'escape_utils', '~> 1.0' unless RUBY_PLATFORM == 'java' # used for uri_template
  spec.add_runtime_dependency 'uri_template', '~> 0.7.0'
  # Required for correct XML namespace handling (MultiXML, oauth2).
  spec.add_runtime_dependency 'ox', '~> 2.1'
end
