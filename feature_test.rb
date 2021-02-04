require_relative 'lib/boris_bikes'

p docking_station = DockingStation.new
p bike = Bike.new

p docking_station.release_bike
p docking_station.dock(bike)
