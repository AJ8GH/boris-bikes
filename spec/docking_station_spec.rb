describe DockingStation do
  let(:bike) { instance_double(Bike, :bike, working?: true) }
  let(:broken_bike) { instance_double(Bike, :broken_bike, working?: false) }

  describe '#release_bike' do
    context 'when not empty' do
      before(:example) { subject.dock(bike) }
      let(:released_bike) { subject.release_bike }

      it { is_expected.to respond_to :release_bike }

      it 'returns a bike' do
        expect(released_bike).to be bike
      end

      it 'returns a working bike' do
        expect(released_bike).to be_working
      end
    end

    context 'when empty' do
      it 'raises error no bike error' do
        expect { subject.release_bike }.to raise_error(NoBikesError, 'No bikes!')
      end
    end

    context 'when all broken' do
      it 'raises No working bikes error' do
        subject.dock(broken_bike)
        expect { subject.release_bike }.to raise_error(NoWorkingBikesError, 'There are no working bikes!')
      end
    end
  end

  describe '#dock' do
    context 'when not full' do
      it { is_expected.to respond_to(:dock).with(1) }

      it 'adds bike to bikes' do
        subject.dock(bike)
        expect(subject.bikes).to include(bike)
      end
    end

    context 'when nearly full' do
      it 'raises no error'  do
        (subject.capacity - 1).times { subject.dock(bike) }
        expect { subject.dock(bike) }.to_not raise_error
      end
    end

    context 'when full' do
      it 'raises error' do
        subject.capacity.times { subject.dock(bike) }
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
      it 'returns false' do
        subject.dock(bike)
        expect(subject.send(:no_bikes?)).to be false
      end
    end
  end

  describe '#full?' do
    context 'when empty' do
      it 'returns false' do
        expect(subject.send(:full?)).to be false
      end
    end

    context 'when full' do
      it 'returns true' do
        subject.capacity.times { subject.dock(bike) }
        expect(subject.send(:full?)).to be true
      end
    end
  end

  describe '#capacity' do
    let(:station) { described_class.new(40) }
    it 'returns the default capacity' do
      expect(subject.capacity).to eq described_class::DEFAULT_CAPACITY
    end

    it 'can be set on initialization' do
      expect(station.capacity).to eq 40
    end
  end

  describe '#all_broken?' do
    context 'when all broken' do
      it 'returns true' do
        subject.dock(broken_bike)
        expect(subject.send(:all_broken?)).to be true
      end
    end
  end
end
