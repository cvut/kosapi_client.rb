shared_examples_for 'fluent api command' do |method, *args|

  it 'returns self' do
    expect(builder.send(method, *args)).to be builder
  end

end
