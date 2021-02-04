describe DockingStation do
  let(:bike) { Bike.new }

  describe '#release_bike' do
    it { is_expected.to respond_to :release_bike }

    let(:released_bike) { subject.release_bike }

    it 'returns a bike' do
      expect(released_bike).to be_an_instance_of Bike
    end

    it 'returns a working bike' do
      expect(released_bike.working?).to be true
    end
  end

  describe '#bikes' do
    subject(:bikes) { described_class.new.bikes }
    it { is_expected.to be_an_instance_of Array }
  end

  describe '#dock' do
    it { is_expected.to respond_to(:dock_bike).with(1) }

    it 'adds bike to bikes' do
      subject.dock(bike)
      expect(subject.bikes).to include(bike)
    end
  end
end
