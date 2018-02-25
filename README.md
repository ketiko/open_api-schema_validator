# OpenApi::SchemaValidator [![Build Status](https://travis-ci.org/ketiko/open_api-schema_validator.svg?branch=master)](https://travis-ci.org/ketiko/open_api-schema_validator)

JSON Schema Validator for OpenAPI

Currently supports OpenApi v2 schema. See [https://github.com/OAI/OpenAPI-Specification/issues/1301](https://github.com/OAI/OpenAPI-Specification/issues/1301)
for v3 release.

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

Validate your schema against the OpenApi schema.
```ruby
OpenApi::SchemaValidator.validate!(json)
```

Validate a json response against part of your schema
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
