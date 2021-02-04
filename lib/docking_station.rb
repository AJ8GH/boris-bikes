class DockingStation
  attr_reader :bikes
  attr_accessor :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    raise NoBikesError if no_bikes?
    Bike.new
  end

  def dock(bike)
    raise CapacityError if capacity_full?
    bikes << bike
  end

  private

  def no_bikes?
    bikes.empty?
  end

  def capacity_full?
    bikes.count >= capacity
  end
end
