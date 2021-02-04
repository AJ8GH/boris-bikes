class DockingStation
  DEFAULT_CAPACITY = 20

  attr_reader :bikes
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    raise NoBikesError if no_bikes?
    Bike.new
  end

  def dock(bike)
    raise CapacityError if full?
    bikes << bike
  end

  private

  def no_bikes?
    bikes.empty?
  end

  def full?
    bikes.count >= capacity
  end
end
