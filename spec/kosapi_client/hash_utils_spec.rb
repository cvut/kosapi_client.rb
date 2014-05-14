require 'spec_helper'

describe KOSapiClient::HashUtils do

  let(:k1) {double(visited: :k1)}
  let(:k2) {double(visited: :k2)}
  let(:source_hash) { {k1 => [{k2 => :foo}]} }

  it 'iterates over all keys' do
    expect(k1).to receive(:visited)
    expect(k2).to receive(:visited)
    KOSapiClient::HashUtils.deep_transform_hash_keys(source_hash) { |key| key.visited }
  end

  it 'returns hash with modified keys' do
    result = KOSapiClient::HashUtils.deep_transform_hash_keys(source_hash) { |key| key.visited }
    expect(result).to eq({k1: [{k2: :foo}]})
  end

end
