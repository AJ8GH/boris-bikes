module BikeContainer
  attr_accessor :bikes, :capacity

  def initialize(capacity = self.class::DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end
end
