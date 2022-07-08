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
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.9'
  spec.add_development_dependency 'rspec-given', '~> 3.8'
  spec.add_development_dependency 'dotenv', '~> 2.7'
  spec.add_development_dependency 'vcr', '~> 3.0'
  spec.add_development_dependency 'codeclimate-test-reporter', '~> 1.0.0'
  spec.add_development_dependency 'guard-rspec', '~> 4.7'
  spec.add_development_dependency 'coveralls', '~> 0.8'
  spec.add_development_dependency 'fuubar', '~> 2.2.0'
  spec.add_development_dependency 'simplecov', '~> 0.12'

  spec.add_runtime_dependency 'oauth2', '~> 2.0'
  spec.add_runtime_dependency 'faraday', '>= 0.9', '< 3.0'
  spec.add_runtime_dependency 'corefines', '~> 1.6'
  spec.add_runtime_dependency 'uri_template', '~> 0.7.0'
  # Required for correct XML namespace handling (MultiXML, oauth2).
  spec.add_runtime_dependency 'ox', '~> 2.1'
end
