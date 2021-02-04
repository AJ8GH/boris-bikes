class NoBikesError < StandardError
  def initialize(msg = 'No bikes!')
    super(msg)
  end
end

class CapacityError < StandardError
  def initialize(msg = 'Docking station full!')
    super(msg)
  end
end

class NoWorkingBikesError < StandardError
  def initialize(msg = 'There are no working bikes!')
    super(msg)
  end
end
