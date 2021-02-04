class NoBikesError < StandardError
  def initialize(msg = 'No bikes!')
    super(msg)
  end
end
