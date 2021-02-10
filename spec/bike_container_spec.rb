shared_examples 'bike containers' do
  describe '#bikes' do
    let(:bike) { instance_double(Bike, 'Bike') }

    context 'when initialized' do
      subject { described_class.new.bikes }
      it { is_expected.to be_empty }
    end

    context 'when adding bikes' do
      it 'accepts new bikes' do
        subject.bikes << bike
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
