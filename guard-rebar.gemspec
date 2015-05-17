require File.expand_path('../lib/guard/rebar/version', __FILE__)

Gem::Specification.new do |s|
  s.name          = "guard-rebar"
  s.version       = Guard::Rebar::VERSION
  s.summary       = "Guard Rebar plugin"
  s.authors       = ["Andrzej Sliwa"]
  s.email         = ["andrzej.sliwa@gmail.com"]
  s.homepage      = "http://github.com/andrzejsliwa/guard-rebar"

  s.files         = Dir.glob('{lib}/**/*') + %w[LICENSE README.md]
  s.require_paths = ["lib"]

  s.add_dependency 'guard', '~> 2.0.0'
  s.add_development_dependency 'rspec'
end
