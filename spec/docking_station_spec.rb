require 'docking_station'

describe DockingStation do
  subject(:docking_station) {described_class.new}
  let(:bike) {double :bike}
  let(:broken_bike) {double :bike}


  describe 'initialization' do
    it 'has a variable capacity' do
      docking_station2 = DockingStation.new(50)
      50.times {docking_station2.dock(bike)}
      expect{docking_station2.dock(bike)}.to raise_error('docking station full')
    end
  end

  describe '#release_bike' do
    it 'should release a bike from the docking station' do
      allow(bike).to receive(:working).and_return(true)
      docking_station.dock(bike)
      expect(docking_station.release_bike).to eq(bike)
    end

    it 'should not release a bike if the docking station is empty' do
      expect{docking_station.release_bike}.to raise_error('docking station empty')
    end

    it 'should not release a bike if the bike is broken' do
      allow(broken_bike).to receive(:working).and_return(false)
      docking_station.dock(broken_bike)
      expect{docking_station.release_bike}.to raise_error('cannot release a broken bike')
    end
  end

  describe '#dock' do
    it 'should dock a bike in the docking station' do
      expect(docking_station.dock(bike)).to include(bike)
    end

    it 'should not dock a bike if capacity is reached' do
      DockingStation::DEFAULT_CAPACITY.times {docking_station.dock(bike)}
      expect{docking_station.dock(bike)}.to raise_error('docking station full')
    end

    it 'should dock broken bikes' do
      allow(broken_bike).to receive(:broken).and_return(false)
      expect(docking_station.dock(broken_bike)).to include(broken_bike)
    end

  end

  describe '#capacity' do
    it 'should have a default' do
      expect(docking_station.capacity).to eq(DockingStation::DEFAULT_CAPACITY)
    end
  end
end
