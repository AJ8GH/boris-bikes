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
