# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'collection_filter/version'

Gem::Specification.new do |spec|
  spec.name          = 'collection_filter'
  spec.version       = CollectionFilter::VERSION
  spec.authors       = ['Nahuel Garbezza']
  spec.email         = ['n.garbezza@gmail.com']

  spec.summary       = 'Filter objects for collections'
  spec.description   = 'Filter objects for collections'
  spec.homepage      = 'https://github.com/ngarbezza/collection_filter'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  else
    raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 3.1'

  spec.metadata['rubygems_mfa_required'] = 'true'
end
