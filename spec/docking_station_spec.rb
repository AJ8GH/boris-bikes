require 'docking_station'

describe DockingStation do
  subject (:docking_station) { DockingStation.new }

  it 'creates a new DockingStation' do
    expect { DockingStation.new }.to_not raise_error
  end


  describe '#release_bike' do
    it 'responds to release_bike' do
      expect(docking_station).to respond_to(:release_bike)
    end
  end
end
