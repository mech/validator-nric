# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'validator/nric/version'

Gem::Specification.new do |spec|
  spec.name          = 'validator-nric'
  spec.version       = Validator::Nric::VERSION
  spec.authors       = ['mech']
  spec.email         = ['mech@me.com']
  spec.summary       = 'Validates Singapore NRIC'
  spec.description   = 'Global validator as well as ActiveModel validator'
  spec.homepage      = 'https://github.com/mech/validator-nric'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.1'
  spec.add_development_dependency 'rubocop'
end
