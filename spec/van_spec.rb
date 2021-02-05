describe Van do
  let(:bike) { instance_double(Bike, 'Bike', working?: true) }
  let(:broken_bike) { instance_double(Bike, 'Broken Bike', working?: false) }
  let(:bike_array) { [bike, broken_bike, bike, broken_bike] }
  let(:bad_station) { instance_double(DockingStation, 'Bad Station', bikes: bike_array) }
  let(:good_station) { instance_double(DockingStation, 'Good Station', bikes: [bike, bike]) }
  let(:large_station) { instance_double(DockingStation, 'Large Station', bikes: (bike_array * 3)) }


  describe '#bikes' do
    it 'starts empty' do
      expect(subject.bikes).to eq []
    end
  end

  describe '#collect' do
    context 'when there are broken and working bikes' do
      before(:example) { subject.collect(bad_station) }
      it 'collects all broken bikes' do
        expect(subject.bikes).to eq [broken_bike, broken_bike]
      end

      it 'removes bikes from docking station' do
        expect(bad_station.bikes).to eq [bike, bike]
      end
    end

    context 'when there are no broken bikes' do
      before(:example) { subject.collect(good_station) }
      it 'collects nothing' do
        expect(subject.bikes).to be_empty
      end
    end

    context 'when there are many bikes' do
      before(:example) { subject.collect(large_station) }
      it 'collects all broken bikes' do
        expect(large_station.bikes).to all(be_working)
      end

      it 'only collects broken bikes' do
        expect(subject.bikes.none? { |bike| bike.working? }).to be true
      end

      it 'maintains the overall number of bikes' do
        expect(subject.bikes.count + large_station.bikes.count).to eq bike_array.count * 3
      end
    end
  end
end