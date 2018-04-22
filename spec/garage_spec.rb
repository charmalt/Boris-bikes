require 'garage'

describe Garage do

  subject(:garage) {Garage.new}
  let(:bike) {double :bike, working: true, fix: true}

  describe '#collect_bikes', :collect do
    it 'collects broken bikes from van' do
      garage.collect_bikes(bike)
      expect(garage.bikes).to eq [bike]
    end
  end

  describe '#return_broken_bikes', :return do
    it 'returns bikes to van' do
      garage.bikes << bike
      garage.return_bikes
      expect(garage.bikes == []).to eq true
    end

    it 'returns repaired bikes' do
      garage.bikes << bike
      garage.return_bikes
      expect(bike.working).to eq true
    end

  end

end
