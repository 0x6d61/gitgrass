# Gitgrass

Command to display grass of github with CLI

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'gitgrass'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install gitgrass

## Usage


Display for the past year:
```
gitgrass show 0x6d61
```
Show commit for the specified year:
```
gitgrass show 0x6d61 -y 2020
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

