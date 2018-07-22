lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tinby/version'

Gem::Specification.new do |spec|
  spec.name          = 'tinby'
  spec.version       = Tinby::VERSION
  spec.authors       = ['joe']
  spec.email         = ['kinjoyuji@gmail.com']

  spec.summary       = 'this is tinder api wrapper. we can fetch and post to tinder.'
  spec.description   = 'this is tinder api wrapper. we can fetch and post to tinder.'
  spec.homepage      = 'https://github.com/Cam1no/tinby.git'
  spec.license       = 'MIT'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'

  spec.add_dependency 'faraday', '~> 0'
  spec.add_dependency 'faraday_middleware', '~> 0'
  spec.add_dependency 'json', '~> 0'
  spec.add_dependency 'tinder_auth_fetcher', '~> 0'
end
