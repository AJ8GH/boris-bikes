require 'bike'

describe Bike do
  subject (:bike) { Bike.new }

  it 'responds to working?' do
    expect(bike).to respond_to(:working?)
  end
end
