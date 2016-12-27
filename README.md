# redirect_follow_get

`redirect_follow_get` is simple http get method following redirect. It wraps `net/http` library.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'redirect_follow_get'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install redirect_follow_get

## Usage

`redirect_follow_get` returns `Net::HTTPOK` when the request gets 200 response.

```rb
response = redirect_follow_get('http://google.com/')
# => #<Net::HTTPOK 200 OK readbody=true>
```

```rb
response.code
# => "200"

response.uri
# => #<URI::HTTP http://www.google.co.jp/?gfe_rd=...>

response.body
# => "<!doctype html><html ...
```

### Redirection limit

You can limit the number of redirects with `limit:` option. **Default redirects limit is 10.**

```rb
response = redirect_follow_get('http://google.com/', limit: 1)
# RedirectFollowGet::TooManyRedirects: too many HTTP redirects
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/toshimaru/redirect_follow_get.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
