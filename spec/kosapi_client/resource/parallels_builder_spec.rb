require 'spec_helper'

describe KOSapiClient::Resource::ParallelsBuilder do

  let(:url_builder) { instance_double(KOSapiClient::URLBuilder, url: 'http://example.com') }
  let(:response) { double(foo: :bar) }
  let(:http_client) { double(send_request: response) }
  subject(:builder) { KOSapiClient::Resource::ParallelsBuilder.new('http://example.com', http_client, url_builder) }

  describe '#related' do

    before { allow(url_builder).to receive(:set_path) }

    it 'throws error when parallel id not set' do
      expect { builder.related }.to raise_error(RuntimeError)
    end

    it 'returns self' do
      builder.find(42)
      expect(builder.related).to eq builder
    end

    it 'adds related to URL' do
      expect(url_builder).to receive(:set_path).with(42, 'related')
      builder.find(42).related
    end

  end

  describe '#students' do

    before { allow(url_builder).to receive(:set_path) }

    it 'throws error when parallel id not set' do
      expect { builder.students }.to raise_error(RuntimeError)
    end

    it 'returns self' do
      builder.find(42)
      expect(builder.students).to eq builder
    end

    it 'adds students to URL' do
      expect(url_builder).to receive(:set_path).with(42, 'students')
      builder.find(42).students
    end

  end
end
