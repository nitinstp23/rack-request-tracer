$:.push File.expand_path('../lib/rack', __FILE__)

# Maintain your gem's version:
require 'request_tracer/version'

Gem::Specification.new do |spec|
  spec.name          = 'rack-request-tracer'
  spec.version       = Rack::RequestTracer::VERSION
  spec.authors       = ['Nitin Misra']
  spec.email         = ['nitin.misra23@gmail.com']
  spec.description   = %q{A Rack Middleware to log request's info to any rack app}
  spec.summary       = spec.description
  spec.homepage      = 'https://github.com/nitinstp23/rack-request-tracer'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(spec)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'rack', '~> 1.5.2'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake', '~> 10.1.1'
  spec.add_development_dependency 'rspec', '~> 2.14'
end
