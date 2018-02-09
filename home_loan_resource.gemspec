
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "home_loan_resource/version"

Gem::Specification.new do |spec|
  spec.name          = "home_loan_resource"
  spec.version       = HomeLoanResource::VERSION
  spec.authors       = ["Andre Possebom", "Pedro Pereira Santos", "Rod Dutra"]
  spec.email         = ["andre@loandolphin.com.au", "pedro@loandolphin.com.au", "rod@loandolphin.com.au"]

  spec.summary       = %q{This gem contains home loan functions.}
  spec.description   = %q{HomeLoanResource library contains a couple of useful functions for home loans.}
  spec.homepage      = "https://github.com/possebom/home_loan_resource_gem"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
