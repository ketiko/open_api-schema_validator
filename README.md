# OpenApi::SchemaValidator [![CircleCI](https://circleci.com/gh/ketiko/open_api-schema_validator.svg?style=svg)](https://circleci.com/gh/ketiko/open_api-schema_validator)

JSON Schema Validator for OpenAPI

Supports OpenApi v2 and v3 schema.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'open_api-schema_validator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install open_api-schema_validator

## Usage

Validate your schema against the OpenApi v2 schema.
```ruby
OpenApi::SchemaValidator.validate!(json)
```

Validate your schema against the OpenApi v3 schema.
```ruby
OpenApi::SchemaValidator.validate!(json, 3)
```

Validate a json response against part of your OpenApi schema
```ruby
OpenApi::SchemaValidator.validate_schema!(
  my_schema_json,
  JSON.parse(response.body),
  fragment: "#/definitions/User"
)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/open_api-schema_validator.
