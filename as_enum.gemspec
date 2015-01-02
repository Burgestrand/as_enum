# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'as_enum/version'

Gem::Specification.new do |spec|
  spec.name          = "as_enum"
  spec.version       = AsEnum::VERSION
  spec.authors       = ["Kim Burgestrand"]
  spec.email         = ["kim@burgestrand.se"]
  spec.summary       = %q{Make any yielding method accept the no-block form of calling.}
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 2"
end
