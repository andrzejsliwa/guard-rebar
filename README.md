# Guard::Rebar

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    notification :emacs

    guard 'rebar-eunit', all_on_start: true, skip_deps: true do
      watch(%r{src/.*?.erl})
      watch(%r{test/.*?.erl})
    end

Or initialize repo:

    bundle guard init rebar

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install guard-rebar

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
