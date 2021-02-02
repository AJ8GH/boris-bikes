require 'docking_station'

describe DockingStation do
  describe '#intialize' do
    it 'creates a new DockingStation' do
      expect { DockingStation.new }.to_not raise_error
    end
  end
end
