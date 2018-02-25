# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'open_api/schema_validator/version'

Gem::Specification.new do |spec|
  spec.name          = 'open_api-schema_validator'
  spec.version       = OpenApi::SchemaValidator::VERSION
  spec.authors       = ['Ryan Hansen']
  spec.email         = ['ketiko@gmail.com']

  spec.summary       = 'JSON Schema Validator for OpenAPI'
  spec.description   = 'JSON Schema Validator for OpenAPI'
  spec.homepage      = 'https://github.com/ketiko/open_api-schema_validator'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'lois', '~> 0.1.6'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'reek'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-rspec'
  spec.add_development_dependency 'simplecov'

  spec.add_dependency 'json-schema'
end
