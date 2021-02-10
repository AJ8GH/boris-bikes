shared_examples 'custom errors' do
  it 'raises custom error and message' do
    expect { raise subject }.to raise_error(subject, subject.msg)
  end
end

describe NoBikesError do
  include_examples 'custom errors'
end

describe CapacityError do
  include_examples 'custom errors'
end

describe NoWorkingBikesError do
  include_examples 'custom errors'
end
