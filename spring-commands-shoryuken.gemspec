lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "spring/commands/shoryuken/version"

Gem::Specification.new do |spec|
  spec.name          = "spring-commands-shoryuken"
  spec.version       = Spring::Commands::Shoryuken::VERSION
  spec.authors       = ["Gabriel Holodak"]
  spec.email         = ["gthepiper@gmail.com"]

  spec.summary       = "shoryuken command for spring"
  spec.homepage      = "https://github.com/keidax/spring-commands-shoryuken"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.require_paths = ["lib"]

  spec.add_dependency "spring", ">= 0.9.1"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
end
