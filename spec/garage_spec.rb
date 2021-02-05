describe Garage do
  let(:bike) { instance_double(Bike, 'Bike') }
  let(:van) { instance_double(Van, 'Van', bikes: [bike]) }

  describe 'bikes' do
    it 'starts empty' do
      expect(subject.bikes).to eq []
    end
  end
end
