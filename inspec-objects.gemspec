# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "inspec-objects/version"

Gem::Specification.new do |spec|
  spec.name          = "inspec-objects"
  spec.version       = InspecObjects::VERSION
  spec.authors       = ["Dominik Richter", "Christoph Hartmann"]
  spec.email         = ["dominik.richter@gmail.com", "chris@lollyrock.com"]
  spec.summary       = "InSpec Objects library"
  spec.description   = "Library that provides an API for programmatically creating InSpec profiles"
  spec.homepage      = "https://github.com/inspec/inspec-objects"
  spec.license       = "Apache-2.0"

  spec.files = %w{
    README.md inspec-objects.gemspec Gemfile
  } + Dir.glob("{lib}/**/*", File::FNM_DOTMATCH).reject { |f| File.directory?(f) }

  spec.require_paths = ["lib"]
  spec.add_dependency "inspec-core"
end
