
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "au_loan_calculations/version"

Gem::Specification.new do |spec|
  spec.name          = "au_loan_calculations"
  spec.version       = AuLoanCalculations::VERSION
  spec.authors       = ["Andre Possebom", "Pedro Pereira Santos", "Rod Dutra"]
  spec.email         = ["andre@loandolphin.com.au", "pedro@loandolphin.com.au", "rod@loandolphin.com.au"]

  spec.summary       = %q{This gem contains home loan functions for Australian market.}
  spec.description   = %q{AuLoanCalculations library contains a couple of useful functions for Austrlian home loans.}
  spec.homepage      = "https://github.com/possebom/au_loan_calculations_gem"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

  # spec.files         = `git ls-files -z`.split("\x0").reject do |f|
  #   f.match(%r{^(test|spec|features)/})
  # end
  spec.files = Dir["{lib,assets}/**/*"] + ["README.md"]
  # s.files      = `git ls-files`.split("\n")
  # s.test_files = `git ls-files -- test/*`.split("\n")

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
