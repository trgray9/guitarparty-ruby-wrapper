# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'guitarparty_client/version'

Gem::Specification.new do |spec|
  spec.name          = "guitarparty_client"
  spec.version       = GuitarpartyClient::Version::VERSION
  spec.authors       = ["Toby"]
  spec.email         = ["trgray9@gmail.com"]

  spec.summary       = %q{A ruby wrapper for the Guitarparty API}
  spec.description   = %q{Provides an easy to use Ruby gem to interact with the Guitarparty API}
  spec.homepage      = "https://github.com/trgray9/guitarparty-ruby-wrapper"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_dependency "rest-client"
  spec.add_dependency "mime-types"
  spec.add_dependency "netrc"
  spec.add_dependency "http-cookie"
  spec.add_dependency "json"
end
