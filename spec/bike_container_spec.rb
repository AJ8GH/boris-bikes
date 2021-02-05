shared_examples 'bike containers' do
  describe '#bikes' do

    context 'when initialized' do
      subject { described_class.new.bikes }
      it { is_expected.to be_an_instance_of Array }
      it { is_expected.to be_empty }
    end

    context 'when adding bikes' do
      let(:bike) { instance_double(Bike, 'Bike') }
      before(:example) { subject.bikes << bike }
      it 'accepts new bikes' do
        expect(subject.bikes).to include(bike)
      end
    end
  end
end

describe DockingStation do
  include_examples 'bike containers'
end

describe Van do
  include_examples 'bike containers'
end

describe Garage do
  include_examples 'bike containers'
end
