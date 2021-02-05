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

  def collect_working(garage)
    bikes = garage.bikes
    self.bikes += find_working(bikes)
    remove_working(bikes)
  end

  def collect_all(location)
    collect_working(location)
    collect_broken(location)
  end

  def deliver_broken(garage)
    garage.bikes += find_broken(bikes)
    remove_broken(bikes)
  end

  def deliver_working(docking_station)
    docking_station.bikes += find_working(bikes)
    remove_working(bikes)
  end

  private

  def find_broken(bikes)
    bikes.reject { |bike| bike.working? }
  end

  def remove_broken(bikes)
    bikes.delete_if { |bike| !bike.working? }
  end

  def find_working(bikes)
    bikes.select { |bike| bike.working? }
  end

  def remove_working(bikes)
    bikes.delete_if { |bike| bike.working? }
  end
end
