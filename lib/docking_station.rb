require_relative 'bike'

class DockingStation
  attr_reader :bikes

  CAPACITY = 20

  def initialize
    @bikes = []
  end

  def release_bike
    fail 'docking station empty' if dock_empty?
    bikes.pop
  end

  def dock(bike)
    fail 'docking station full' if capacity?
    bikes << bike
  end

  private

  def capacity?
    bikes.length >= CAPACITY
  end

  def dock_empty?
    bikes.empty?
  end
end
