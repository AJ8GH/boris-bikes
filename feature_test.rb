require_relative 'lib/boris_bikes'

p 'instiate docking_station:'
p docking_station = DockingStation.new
puts

p 'instiate bike:'
p bike = Bike.new
puts

p 'docking station starts empty:'
p docking_station.bikes
puts

p 'dock bike:'
p docking_station.dock(bike)
puts

p 'release bike:'
p docking_station.release_bike
puts

p 'report bike broken:'
p docking_station.dock(Bike.new.broken)
p docking_station.bikes
puts

p 'only releases working bikes:'
broken_bike = Bike.new.broken
p 'add broken and working bikes to docking station:'
p docking_station.dock(broken_bike)
p docking_station.dock(bike)
p docking_station.dock(broken_bike)
p docking_station.bikes
p 'release a bike:'
p new_bike = docking_station.release_bike
p 'check working?:'
p new_bike.working?
puts

p 'van collects all broken bikes:'
p van = Van.new
p 'starts empty:'
p van.bikes
puts
p 'clear docking_station:'
docking_station.bikes.clear
p docking_station.bikes
puts
p 'fill docking station:'
5.times { docking_station.dock(Bike.new) }
5.times { docking_station.dock(Bike.new.broken) }
p 'docking station bikes:'
p docking_station.bikes
puts
p 'collect...'
p van.collect_broken(docking_station)
puts
p 'van bikes:'
p van.bikes
puts
p 'docking station bikes:'
p docking_station.bikes
puts

p 'create garage'
p garage = Garage.new
puts

p 'van delivers broken bikes'
p van
puts
p garage
puts
p van.deliver_broken(garage)
puts
p garage
puts
p van
