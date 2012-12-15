require File.expand_path('../lib/guard/rebar/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "guard-rebar"
  gem.version       = Guard::Rebar::VERSION
  gem.summary       = "Guard Rebar plugin"
  gem.authors       = ["Andrzej Sliwa"]
  gem.email         = ["andrzej.sliwa@gmail.com"]
  gem.homepage      = "http://github.com/andrzejsliwa/guard-rebar"

  gem.add_dependency 'guard', '~> 1.5.4'

  gem.files         = Dir.glob('{lib}/**/*') + %w[LICENSE README.md]
  gem.require_paths = ["lib"]
end