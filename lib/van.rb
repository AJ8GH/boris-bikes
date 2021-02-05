class Van
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def collect(docking_station)
    docked = docking_station.bikes
    docked.each_with_index { |bike, i| bikes << docked.slice!(i) unless bike.working? }
  end
end
