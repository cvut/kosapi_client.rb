# KOSapi Client

[![Build Status](http://img.shields.io/travis/cvut/kosapi_client.rb.svg)][travis]
[![Dependency Status](http://img.shields.io/gemnasium/cvut/kosapi_client.rb.svg)][gemnasium]
[![Code Climate](http://img.shields.io/codeclimate/github/cvut/kosapi_client.rb.svg)][codeclimate]
[![Coverage Status](https://img.shields.io/coveralls/cvut/kosapi_client.rb.svg)][coveralls]
[![Inline docs](http://inch-ci.org/github/cvut/kosapi_client.rb.svg)](http://inch-ci.org/github/cvut/kosapi_client.rb)

[travis]: http://travis-ci.org/cvut/kosapi_client.rb
[gemnasium]: https://gemnasium.com/cvut/kosapi_client.rb
[codeclimate]: https://codeclimate.com/github/cvut/kosapi_client.rb
[coveralls]: https://coveralls.io/r/cvut/kosapi_client.rb

A simple Ruby client library for [KOSapi RESTful service](https://kosapi.fit.cvut.cz).

## Installation

Add this line to your application's Gemfile:

    gem 'kosapi_client', github: 'flexik/kosapi_client'

And then execute:

    $ bundle

## Basic usage

```ruby
# Creates a new instance of client with OAuth2 credentials
client = KOSapiClient.new({client_id: OAUTH_CLIENT_ID, client_secret: OAUTH_SECRET})

# Retrieves first page of all course events
course_events_page = client.course_events
course_events_page.each { |event| do_stuff_with_event(event) }

# Fetches page of parallels according to API parameters
parallels_page = client.parallels.offset(0).limit(50).query('course.department' => '18*')

# Finds all parallels related to parallel with id = 42
client.parallels.find(42).related
```

## How to extent API functionality

### Add resource

1. Add concrete resource builder to `lib/kosapi_client/resource/`. Use current resources as an inspiration.
2. Register resource in `lib/kosapi_client/api_client.rb` like:

```ruby
module KOSapiClient

  class ApiClient
    include ResourceMapper

    # accessible resources definition
    resource :courses
    resource :course_events
    resource :parallels
    resource :exams
    resource :semesters
    resource :new_resource

    attr_reader :http_client
	...
```

## Configuration

KOSapiClient can be created and configured in two ways.
The simple way is to call `KOSapiClient.new`, which returns ApiClient instance.

```ruby
client = KOSapiClient.new({client_id: OAUTH_CLIENT_ID, client_secret: OAUTH_SECRET})
client.parallels.find(42)
```
    
The other way is to use configure client using `KOSapiClient.configure` and setting options inside block.
In addition to returning the client instance from `configure`, the client is also stored in `KOSapiClient` singleton property and its methods can be accessed by calling them on `KOSapiClient` directly.
This approach is more suitable for configuring client inside an initializer. 
 
```ruby
KOSapiClient.configure do |c|
  c.client_id = ENV['KOSAPI_OAUTH_CLIENT_ID']
  c.client_secret = ENV['KOSAPI_OAUTH_CLIENT_SECRET']
end

KOSapiClient.parallels.find(42)
```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
