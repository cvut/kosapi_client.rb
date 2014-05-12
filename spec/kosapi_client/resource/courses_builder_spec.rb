require 'spec_helper'

describe KOSapiClient::Resource::CoursesBuilder do

  let(:url_builder) { instance_double(KOSapiClient::URLBuilder, url: 'http://example.com', set_query_param: nil) }
  let(:response) { double(foo: :bar) }
  let(:http_client) { double(send_request: response) }
  subject(:builder) { KOSapiClient::Resource::CoursesBuilder.new('http://example.com', http_client, url_builder) }

  describe '#detail' do

    it_behaves_like 'fluent api command', method_name, 10

    it 'sets detail query parameter' do
      expect(url_builder).to receive(:set_query_param).with(:detail, 1)
      builder.detail
    end

  end
end
