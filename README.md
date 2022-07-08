# KOSapi Client

[![Gem Version](https://img.shields.io/gem/v/kosapi_client.svg)](rubygems)
[![Build Status](https://github.com/cvut/kosapi_client.rb/workflows/CI/badge.svg)](https://github.com/cvut/kosapi_client.rb/actions?query=workflow%3A%22CI%22)
[![Code Climate](http://img.shields.io/codeclimate/github/cvut/kosapi_client.rb.svg)][codeclimate]
[![Coverage Status](https://img.shields.io/coveralls/cvut/kosapi_client.rb.svg)][coveralls]
[![Inline docs](http://inch-ci.org/github/cvut/kosapi_client.rb.svg)](http://inch-ci.org/github/cvut/kosapi_client.rb)

[rubygems]: https://rubygems.org/gems/kosapi_client
[codeclimate]: https://codeclimate.com/github/cvut/kosapi_client.rb
[coveralls]: https://coveralls.io/r/cvut/kosapi_client.rb

A simple Ruby client library for [KOSapi RESTful service](https://kosapi.fit.cvut.cz).

## Installation

Add this line to your application's Gemfile:

    gem 'kosapi_client', github: 'cvut/kosapi_client.rb'

And then execute:

    $ bundle

## Basic usage

```ruby
# Creates a new instance of client with OAuth2 credentials
client = KOSapiClient.new({ client_id: OAUTH_CLIENT_ID, client_secret: OAUTH_SECRET })

# Retrieves first page of all course events
course_events_page = client.course_events
course_events_page.each { |event| do_stuff_with_event(event) }

# Fetches page of parallels according to API parameters
parallels_page = client.parallels.offset(0).limit(50).query('course.department' => '18*')

# Finds all parallels related to parallel with id = 42
client.parallels.find(42).related
```

## Configuration

KOSapiClient can be created and configured in two ways.
The simple way is to call `KOSapiClient.new`, which returns an ApiClient instance.

```ruby
client = KOSapiClient.new({ client_id: OAUTH_CLIENT_ID, client_secret: OAUTH_SECRET })
client.parallels.find(42)
```

The other way is to configure client using `KOSapiClient.configure` and setting options inside a block.
In addition to returning the client instance from `configure`, the client is also stored in `KOSapiClient` singleton property and its methods can be accessed by calling them on `KOSapiClient` directly.
This approach is more suitable for configuring client inside an initializer.

```ruby
KOSapiClient.configure do |c|
  c.client_id = ENV['KOSAPI_OAUTH_CLIENT_ID']
  c.client_secret = ENV['KOSAPI_OAUTH_CLIENT_SECRET']
end

KOSapiClient.parallels.find(42)
```

## Development

Run `bin/setup` script to setup dependencies and create `.env` file. You will need to obtain access to KOSapi.

### OAuth Credentials

You will need a KOSapi OAuth credentials from the [Apps Manager](https://auth.fit.cvut.cz/manager/) to run integration specs.

OAuth credentials need to be exposed as environment variables `KOSAPI_OAUTH_CLIENT_ID` and `KOSAPI_OAUTH_CLIENT_SECRET`. If you put them into `.env` file, the test suite will load them for you automatically:

```
KOSAPI_OAUTH_CLIENT_ID=xxx-xxxx-xxxx
KOSAPI_OAUTH_CLIENT_SECRET=yyyyyyyyy
```

### Contributing

Bug reports and pull requests are welcome on GitHub at [cvut/kosapi_client.rb](https://github.com/cvut/kosapi_client.rb). This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
