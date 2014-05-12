# KOSapi Client

[![Build Status](http://img.shields.io/travis/flexik/kosapi_client.svg)][travis]
[![Dependency Status](http://img.shields.io/gemnasium/flexik/kosapi_client.svg)][gemnasium]
[![Code Climate](http://img.shields.io/codeclimate/github/flexik/kosapi_client.svg)][codeclimate]
[![Coverage Status](https://img.shields.io/codeclimate/coverage/github/flexik/kosapi_client.svg)][codeclimate]
[![Inline docs](http://inch-pages.github.io/github/flexik/kosapi_client.svg)](http://inch-pages.github.io/github/flexik/kosapi_client)

[travis]: http://travis-ci.org/flexik/kosapi_client
[gemnasium]: https://gemnasium.com/flexik/kosapi_client
[codeclimate]: https://codeclimate.com/github/flexik/kosapi_client

A simple Ruby client library for [KOSapi RESTful service](https://kosapi.fit.cvut.cz).

## Installation

Add this line to your application's Gemfile:

    gem 'kosapi_client', github: 'flexik/kosapi_client'

And then execute:

    $ bundle

<!--
Or install it yourself as:

    $ gem install kosapi_client
-->

## Basic usage

    # Creates a new instance of client with OAuth2 credentials
    client = KOSapiClient.new(OAUTH_CLIENT_ID, OAUTH_SECRET)

    # Retrieves first page of all course events
    course_events_page = client.course_events
    course_events_page.each { |event| do_stuff_with_event(event) }

    # Fetches page of parallels according to API parameters
    parallels_page = client.parallels.offset(0).limit(50).query('course.department' => '18*')

    # Finds all parallels related to parallel with id = 42
    client.parallels.find(42).related

<!--
## Priority Resources to implement

    Exams
    People
    Rooms
    Students
    Teachers
-->

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
