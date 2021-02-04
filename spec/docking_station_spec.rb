describe DockingStation do
  let(:bike) { Bike.new }

  describe '#release_bike' do
    context 'when not empty' do
      before(:example) { subject.dock(bike) }
      let(:released_bike) { subject.release_bike }

      it { is_expected.to respond_to :release_bike }

      it 'returns a bike' do
        expect(released_bike).to be_an_instance_of Bike
      end

      it 'returns a working bike' do
        expect(released_bike.working?).to be true
      end
    end

    context 'when  empty' do
      it 'raises error no bike error' do
        expect { subject.release_bike }.to raise_error(NoBikesError, 'No bikes!')
      end
    end
  end

  describe '#bikes' do
    subject(:bikes) { described_class.new.bikes }
    it { is_expected.to be_an_instance_of Array }
  end

  describe '#dock' do
    context 'when not full' do
      it { is_expected.to respond_to(:dock).with(1) }

      it 'adds bike to bikes' do
        subject.dock(bike)
        expect(subject.bikes).to include(bike)
      end

      it 'raises no error when nearly full' do
        (subject.capacity - 1).times { subject.dock(bike) }
        expect { subject.dock(bike) }.to_not raise_error(CapacityError)
      end
    end

    context 'when full' do
      before(:example) { subject.capacity.times { subject.dock(bike) } }
      it 'raises error' do
        expect { subject.dock(bike) }.to raise_error(CapacityError, 'Docking station full!')
      end
    end
  end

  describe '#no_bikes?' do
    context 'when empty' do
      it 'returns true' do
        expect(subject.send(:no_bikes?)).to be true
      end
    end

    context 'when not empty' do
      before(:example) { subject.dock(bike) }
      it 'returns false' do
        expect(subject.send(:no_bikes?)).to be false
      end
    end
  end

  describe '#capacity_full?' do
    context 'when empty' do
      it 'returns false' do
        expect(subject.send(:capacity_full?)).to be false
      end
    end

    context 'when full' do
      before(:example) { subject.capacity.times { subject.dock(bike) } }
      it 'returns true' do
        expect(subject.send(:capacity_full?)).to be true
      end
    end
  end

  describe '#capacity' do
    it 'returns the default capacity' do
      expect(subject.capacity).to eq described_class::DEFAULT_CAPACITY
    end
  end
end
