require 'docking_station'

describe DockingStation do
  subject(:docking_station) { DockingStation.new }

  it 'creates a new DockingStation' do
    expect { DockingStation.new }.to_not raise_error
  end

  it 'responds to release_bike' do
    expect(docking_station).to respond_to(:release_bike)
  end

  describe '#release_bike' do
    subject(:bike) { docking_station.release_bike }

    it 'returns a bike' do
      expect(bike.class).to eq Bike
    end

    it 'returns a working bike' do
      expect(bike.working?).to be true
    end
  end
end
