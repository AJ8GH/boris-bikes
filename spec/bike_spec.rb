describe Bike do
  subject (:bike) { Bike.new }

  it 'responds to working?' do
    expect(bike).to respond_to(:working?)
  end

  describe '#broken' do
    before(:example) { bike.broken }
    it 'sets working? to false' do
      expect(bike.working?).to be false
    end
  end
end
