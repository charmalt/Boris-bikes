require 'van'

describe Van, :van do
let(:broken_bike) {double :broken_bike, working: false}
let(:bike) {double :bike, working: true}
let(:station) {instance_double DockingStation, dock_bike: [broken_bike], broken_bikes: [broken_bike]}
let(:garage) {double :garage, bikes: []}
let(:garage_repair) {double :garage, bikes: [bike]}


  describe '#collect_broken_bikes', :collect do
    it 'returns array of broken bikes' do
      station.dock_bike(broken_bike)
      expect(subject.collect_broken_bikes(station)).to eq [broken_bike]
    end

    it 'raises an error when there are no broken bikes to collect' do
      station.dock_bike(broken_bike)
      subject.collect_broken_bikes(station)
      expect{subject.collect_broken_bikes(station)}.to raise_error "There are no broken bikes to collect"
    end
  end

  describe '#drop_off_broken_bikes', :dropoff do

    it 'responds to the method drop off broken bikes' do
      expect(subject).to respond_to(:drop_off_broken_bikes)
    end

    it 'drops off broken bikes' do
      subject.bikes << [broken_bike]
      expect(subject.drop_off_broken_bikes(garage)).to eq []
    end

  end

  describe '#collect_repaired_bikes', :collect_repairs do

    it 'collects repaired bikes' do
      expect(subject.collect_repaired_bikes(garage_repair)).to eq [bike]
    end
  end
end
