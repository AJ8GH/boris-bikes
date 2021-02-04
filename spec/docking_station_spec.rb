describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  describe '#release_bike' do
    let(:bike) { subject.release_bike }

    it 'returns a bike' do
      expect(bike).to be_an_instance_of Bike
    end

    it 'returns a working bike' do
      expect(bike.working?).to be true
    end
  end
end
