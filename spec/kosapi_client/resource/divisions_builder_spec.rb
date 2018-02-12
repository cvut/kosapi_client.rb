require 'spec_helper'

describe KOSapiClient::Resource::DivisionsBuilder do

  let(:url_builder) { instance_double(KOSapiClient::URLBuilder, url: 'http://example.com') }
  let(:response) { double(foo: :bar) }
  let(:http_client) { double(send_request: response) }
  subject(:builder) { KOSapiClient::Resource::DivisionsBuilder.new('http://example.com', http_client, url_builder) }

  describe '#courses' do

    before { allow(url_builder).to receive(:set_path) }

    it 'throws error when division id is not set' do
      expect { builder.courses }.to raise_error(RuntimeError)
    end

    it 'return self' do
      builder.find(69)
      expect(builder.courses).to eq builder
    end

    it 'adds courses to URL' do
      expect(url_builder).to receive(:set_path).with(69, 'courses')
      builder.find(69).courses
    end
  end

  describe '#subdivisions' do

    before { allow(url_builder).to receive(:set_path) }

    it 'throws error when division id is not set' do
      expect { builder.subdivisions }.to raise_error(RuntimeError)
    end

    it 'return self' do
      builder.find(69)
      expect(builder.subdivisions).to eq builder
    end 

    it 'adds subdivisions to URL' do
      expect(url_builder).to receive(:set_path).with(69, 'subdivisions')
      builder.find(69).subdivisions
    end
  end

  describe '#teachers' do

    before { allow(url_builder).to receive(:set_path) }

    it 'throws error when division id is not set' do
      expect { builder.teachers }.to raise_error(RuntimeError)
    end

    it 'return self' do
      builder.find(69)
      expect(builder.teachers).to eq builder
    end 

    it 'adds teachers to URL' do
      expect(url_builder).to receive(:set_path).with(69, 'teachers')
      builder.find(69).teachers
    end
  end
end
