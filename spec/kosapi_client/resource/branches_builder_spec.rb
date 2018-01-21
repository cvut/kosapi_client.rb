require 'spec_helper'

describe KOSapiClient::Resource::BranchesBuilder do

  let(:url_builder) { instance_double(KOSapiClient::URLBuilder, url: 'http://example.com') }
  let(:response) { double(foo: :bar) }
  let(:http_client) { double(send_request: response) }
  subject(:builder) { KOSapiClient::Resource::BranchesBuilder.new('http://example.com', http_client, url_builder)}

  describe '#study_plans' do

    before { allow(url_builder).to receive(:set_path) }

    it 'throws error when branch id is not set' do
      expect { builder.study_plans }.to raise_error(RuntimeError)
    end

    it 'returns self' do
      builder.find(69)
      expect(builder.study_plans).to eq builder
    end

    it 'adds studyPlans to URL' do
      expect(url_builder).to receive(:set_path).with(69, 'studyPlans')
      builder.find(69).study_plans
    end
  end
end
