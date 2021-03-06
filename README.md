# HubTran

Wrapper for the [HubTran](https://www.hubtran.com/) API.

What is HubTran? HubTran ends back-office frustration for transportation companies. Please email support@hubtran.com if you would like an account to try it out.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hubtran'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hubtran

## Usage

Configure the gem:

```
Hubtran.configure do |config|
  config.token = "your-token"
  config.endpoint = "talk-to-randy"
end
```

Then add some loads with:

```
load = Hubtran::Load.new({load_id: "load1234", external_id: "externalid1234"})
load.save
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/r38y/hubtran.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

