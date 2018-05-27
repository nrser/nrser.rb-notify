
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

  spec.files         = Dir['lib/**/*.rb'] +
                        Dir['assets/**/*.png'] +
                        %w(LICENSE.txt README.md VERSION)
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  
  
  # Dependencies
  # ==========================================================================
  
  # Development Dependencies
  # --------------------------------------------------------------------------
  
  spec.add_development_dependency "bundler", "~> 1.16", '>= 1.16.1'
  
  spec.add_development_dependency "rake", "~> 12.3"
  
  # Testing with `rspec`
  spec.add_development_dependency "rspec", "~> 3.7"
  
  # Doc site generation with `yard`
  spec.add_development_dependency 'yard', '~> 0.9.12'
  
  # GitHub-Flavored Markdown (GFM) for use with `yard`
  spec.add_development_dependency 'github-markup', '~> 1.6'
  
  # Provider for `commonmarker`, the new GFM lib
  spec.add_development_dependency 'yard-commonmarker', '~> 0.3.0'
  
  # Nicer REPL experience
  spec.add_development_dependency "pry", '~> 0.10.4'
  
  
  # Runtime Dependencies
  # --------------------------------------------------------------------------
  
  spec.add_dependency 'nrser', '~> 0.3.6'
  
  # System notification support on OSX
  spec.add_dependency 'terminal-notifier', '~> 2.0.0'
  
end
