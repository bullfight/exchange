# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'exchange/version'

Gem::Specification.new do |spec|
  spec.name          = "exchange"
  spec.version       = Exchange::VERSION
  spec.authors       = ["Patrick Schmitz"]
  spec.email         = ["p.schmitz@gmail.com"]

  spec.summary       = %q{A wrapper around the Stripe Charge interface.}
  spec.homepage      = "https://github.com/bullfight/exchange"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "virtus"
  spec.add_dependency "stripe", '~> 1.21.0'
  spec.add_dependency "activesupport"

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "pry"
end
