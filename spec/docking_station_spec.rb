require 'docking_station'

describe DockingStation do
  subject(:docking_station) {described_class.new}
  let(:bike) {double :bike}

  describe '#release_bike' do
    it 'should release a bike from the docking station' do
      docking_station.dock(bike)
      expect(docking_station.release_bike).to eq(bike)
    end

    it 'should not release a bike if the docking station is empty' do
      expect{docking_station.release_bike}.to raise_error('docking station empty')
    end
  end

  describe '#dock' do
    it 'should dock a bike in the docking station' do
      docking_station.dock(bike)
      expect(docking_station.bikes).to include(bike)
    end

    it 'should not dock a bike if capacity is reached' do
      DockingStation::CAPACITY.times {docking_station.dock(bike)}
      expect{docking_station.dock(bike)}.to raise_error('docking station full')
    end

  end
end
