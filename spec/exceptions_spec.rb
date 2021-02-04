describe NoBikesError do
  it 'raises No bikes! error' do
    expect { raise subject }.to raise_error(subject, 'No bikes!')
  end
end

describe CapacityError do
  it 'raises error when station is full' do
    expect { raise subject }.to raise_error(subject, 'Docking station full!')
  end
end
