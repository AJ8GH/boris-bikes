class Bike
  attr_accessor :working
  alias :working? :working
  undef :working

  def initialize
    @working = true
  end

  def broken
    self.working = false
  end
end
