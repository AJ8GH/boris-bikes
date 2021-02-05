module BikeContainer
  DEFAULT_CAPACITY = 20

  attr_accessor :bikes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end
end
