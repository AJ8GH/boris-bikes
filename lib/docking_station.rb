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
    raise NoWorkingBikesError if all_broken?
    find_working_bike
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

  def all_broken?
    bikes.none? { |bike| bike.working? }
  end

  def find_working_bike
    bikes.each_with_index { |bike, i| return bikes.slice!(i) if bike.working? }
  end
end
