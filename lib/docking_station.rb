require_relative 'bike'

class DockingStation
  attr_accessor :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail 'docking station empty' if dock_empty?
    fail 'cannot release a broken bike' unless bikes.last.working
    bikes.pop
  end

  def dock(bike)
    fail 'docking station full' if full?
    bikes << bike
  end

  private
  attr_reader :bikes
  def full?
    bikes.length >= capacity
  end

  def dock_empty?
    bikes.empty?
  end
end
