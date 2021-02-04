class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    raise NoBikesError if no_bikes?
    Bike.new
  end

  def dock(bike)
    bikes << bike
  end

  private

  def no_bikes?
    bikes.empty?
  end
end
