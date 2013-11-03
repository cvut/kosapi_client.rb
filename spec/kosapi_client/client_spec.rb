require 'spec_helper'

describe KOSapiClient::Client, :vcr do

  Given(:client) { KOSapiClient::Client.new(ENV['KOSAPI_OAUTH_CLIENT_ID'], ENV['KOSAPI_OAUTH_CLIENT_SECRET']) }

  context 'fresh after creation' do
    context 'when requesting course_events' do
      When(:response) { client.course_events }
      Then { response != nil }
    end

    context 'when authorizing' do
      When(:token) { client.authorize }
      Then { token != nil }
      And { client.token == token }
    end

  end
end
