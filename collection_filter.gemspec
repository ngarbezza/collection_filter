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
  spec.required_ruby_version = '>= 2.7'

  spec.add_development_dependency 'bundler', '~> 2.4.5'
  spec.add_development_dependency 'error_handling_protocol', '~> 0.0.1'
  spec.add_development_dependency 'minitest', '~> 5.14'
  spec.add_development_dependency 'minitest-reporters', '~> 1.4'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rubocop', '~> 1.13'
  spec.add_development_dependency 'rubocop-minitest', '~> 0.12'
  spec.add_development_dependency 'rubocop-rake', '~> 0.5'
  spec.metadata['rubygems_mfa_required'] = 'true'
end
