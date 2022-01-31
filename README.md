# Gtmsnippet

A Ruby helper that provides Google Tag Manager Snippet.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'gtmsnippet', github: "colorfulcompany/gtmsnippet"
```

## Usage

```bash
export GTM_CONTAINER=GTM-1234567
export GTM_AUTH=xxx
export GTM_PREVIEW=env-1
```

```ruby
require "gtmsnippet"

include Gtmsnippet::Helper 
```

```html
<head>
    <%= gtm_head_snippet %>
</head>
<body>
    <%= gtm_body_snippet %>
</body>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/colorfulcompany/gtmsnippet.

## References

- [koic/gtm_rails: Simply embed Google Tag Manager container snippet into Rails application](https://github.com/koic/gtm_rails)
