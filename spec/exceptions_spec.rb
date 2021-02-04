describe NoBikesError do
  it 'raises No bikes! error' do
    expect { raise subject }.to raise_error(subject, 'No bikes!')
  end
end

describe CapacityError do
  context 'when station is full' do
    it 'raises error Capacity Error' do
      expect { raise subject }.to raise_error(subject, 'Docking station full!')
    end
  end
end

describe NoWorkingBikesError do
  context 'when all bikes are broken' do
    it 'raises No Working Bikes Error' do
      expect { raise subject }.to raise_error(subject, 'There are no working bikes!')
    end
  end
end
