class Van
  attr_accessor :bikes

  def initialize
    @bikes = []
  end

  def collect_broken(docking_station)
    bikes = docking_station.bikes
    self.bikes += find_broken(bikes)
    remove_broken(bikes)
  end

  private

  def find_broken(bikes)
    bikes.reject { |bike| bike.working? }
  end

  def remove_broken(bikes)
    bikes.delete_if { |bike| !bike.working? }
  end
end
