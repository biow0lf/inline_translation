# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'babbel'

Gem::Specification.new do |spec|
  spec.name          = "babbel"
  spec.version       = Babbel::VERSION
  spec.authors       = ["James Kiesel"]
  spec.email         = ["james.kiesel@gmail.com"]
  spec.summary       = "Store on-the-fly translations using Bing (or others!)"
  spec.description   = "Sets up a framework for allowing inline translation of database content"
  spec.homepage      = "http://www.github.com/gdpelican/babbel"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*.rb"]
  spec.test_files    = Dir["test/**/*.rb"]
  spec.require_paths = ["lib", "test"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end