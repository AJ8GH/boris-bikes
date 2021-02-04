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
    bikes.pop
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

  def find_working_bike
    bikes.each_with_index do |bike, i|
      return bikes.slice!(i) if bike.working?
    end
  end
end
