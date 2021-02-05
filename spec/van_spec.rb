describe Van do
  let(:bike) { instance_double(Bike, 'Bike', working?: true) }
  let(:broken_bike) { instance_double(Bike, 'Broken Bike', working?: false) }
  let(:bike_array) { [bike, broken_bike, bike, broken_bike] }
  let(:bad_station) { instance_double(DockingStation, 'Bad Station', bikes: bike_array) }
  let(:large_station) { instance_double(DockingStation, 'Large Station', bikes: (bike_array * 3)) }

  describe '#bikes' do
    it 'starts empty' do
      expect(subject.bikes).to eq []
    end
  end

  context 'when collecting' do
    describe '#collect_broken' do
      context 'when there are broken and working bikes' do
        before(:example) { subject.collect_broken(bad_station) }

        it 'collects all broken bikes' do
          expect(subject.bikes).to eq [broken_bike, broken_bike]
        end

        it 'removes bikes from docking station' do
          expect(bad_station.bikes).to eq [bike, bike]
        end
      end

      context 'when there are no broken bikes' do
        let(:good_station) { instance_double(DockingStation, 'Good Station', bikes: [bike, bike]) }
        before(:example) { subject.collect_broken(good_station) }

        it 'collects nothing' do
          expect(subject.bikes).to be_empty
        end
      end

      context 'when there are many bikes' do
        before(:example) { subject.collect_broken(large_station) }

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

    describe '#collect_working' do
      before(:example) { subject.collect_working(large_station) }
      it 'collects only working bikes' do
        expect(subject.bikes).to all(be_working)
      end

      it 'collects all working bikes' do
        expect(large_station.bikes.none? { |bike| bike.working? }).to be true
      end

      it 'maintains the overall number of bikes' do
        expect(subject.bikes.count + large_station.bikes.count).to eq bike_array.count * 3
      end
    end

    describe '#collect_all' do
      before(:example) { subject.collect_all(large_station) }
      it 'collects all bikes' do
        expect(large_station.bikes).to be_empty
      end

      it 'maintains the overall number of bikes' do
        expect(subject.bikes.count).to eq bike_array.count * 3
      end
    end
  end

  context 'when delivering' do
    let(:bikes_array) { [] }
    let(:garage) { instance_double(Garage, 'Garage', bikes: bikes_array, :bikes= => bikes_array ) }

    describe '#deliver_broken' do
      before(:example) { subject.collect_all(large_station) }
      before(:example) { subject.deliver_broken(garage) }

      it 'delivers only broken_bikes' do
        expect(subject.bikes).to eq [bike] * 6
      end

      it 'delivers all the broken bikes' do
        expect(subject.bikes).to all(be_working)
      end
    end

    describe '#deliver_working' do
      before(:example) { subject.collect_all(large_station) }
      before(:example) { subject.deliver_working(garage) }

      it 'delivers only working_bikes' do
        expect(garage.bikes).to all(be_working)
      end

      it 'delivers all the working bikes' do
        expect(subject.bikes).to eq [broken_bike] * 6
      end
    end
  end
end
