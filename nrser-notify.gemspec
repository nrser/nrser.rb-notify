
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "nrser/notify/version"

Gem::Specification.new do |spec|
  spec.name          = "nrser-notify"
  spec.version       = NRSER::Notify::VERSION
  spec.authors       = ["nrser"]
  spec.email         = ["neil@neilsouza.com"]

  spec.summary       = %q{User notification support (OSX-only for now)}
  # spec.description   = %q{TODO: Write a longer description or delete this line.}
  spec.homepage      = "https://github.com/nrser/nrser.rb-notify"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*.rb"] + %w(LICENSE.txt README.md)
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
