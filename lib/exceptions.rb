class NoBikesError < StandardError
  attr_reader :msg

  def initialize(msg = 'No bikes!')
    super(msg)
  end
end

class CapacityError < StandardError
  attr_reader :msg

  def initialize(msg = 'Docking station full!')
    super(msg)
  end
end

class NoWorkingBikesError < StandardError
  attr_reader :msg
  
  def initialize(msg = 'There are no working bikes!')
    super(msg)
  end
end
