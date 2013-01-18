# Guard::Rebar

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem "guard-rebar"

Example Gemfile should looks like:

    source 'http://rubygems.org'

    group :development do
      gem "guard-rebar"
      gem "rb-fsevent", require: false # for macosx
    end

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install guard-rebar

## Configuration

Add this line to your application's Guardfile:

    notification :emacs

    guard 'rebar-compile', all_on_start: true do
      watch(%r{src/.*?.erl})
      watch(%r{test/.*?.erl})
    end

    # or/and ...

    guard 'rebar-eunit', all_on_start: true, skip_deps: true do
      watch(%r{src/.*?.erl})
      watch(%r{test/.*?.erl})
    end

    # or/and ...

    guard 'rebar-deps', all_on_start: true do
      watch(%r{rebar?.config})
    end

Just remember if you have same pattern in multiple watch definitions then
order of guards definition is important (better is compile first and later run eunit).

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
