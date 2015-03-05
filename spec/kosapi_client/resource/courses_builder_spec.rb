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

  describe '#students' do

    before { allow(url_builder).to receive(:set_path) }

    it 'throws error when course id not set' do
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

  describe '#parallels' do

    before { allow(url_builder).to receive(:set_path) }

    it 'throws error when course id not set' do
      expect { builder.parallels }.to raise_error(RuntimeError)
    end

    it 'returns self' do
      builder.find(42)
      expect(builder.parallels).to eq builder
    end

    it 'adds students to URL' do
      expect(url_builder).to receive(:set_path).with(42, 'parallels')
      builder.find(42).parallels
    end
  end

  describe '#instances' do

    before { allow(url_builder).to receive(:set_path) }

    it 'throws error when course id not set' do
      expect { builder.instances }.to raise_error(RuntimeError)
    end

    it 'returns self' do
      builder.find(42)
      expect(builder.instances).to eq builder
    end

    it 'adds instances to URL' do
      expect(url_builder).to receive(:set_path).with(42, 'instances')
      builder.find(42).instances
    end
  end

  describe '#instance' do

    before { allow(url_builder).to receive(:set_path) }

    it 'throws error when course id not set' do
      expect { builder.instance('foo') }.to raise_error(RuntimeError)
    end

    it 'adds instance to URL' do
      expect(url_builder).to receive(:set_path).with(42)
      expect(url_builder).to receive(:set_path).with(42, 'instances', 'foo')
      builder.find(42).instance('foo')
    end
  end

end
