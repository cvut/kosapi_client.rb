# KOSapi Client

A simple Ruby client library for KOSapi REST service (https://kosapi.fit.cvut.cz).

## Installation

Add this line to your application's Gemfile:

    gem 'kosapi_client'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install kosapi_client

## Usage

client = KOSapiClient.new(OAUTH_CLIENT_ID, OAUTH_SECRET)

response = client.course_events.all
response = client.course_events.all

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
