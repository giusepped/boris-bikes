require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    raise "No bikes available" if @bikes.size == 0
    @bikes.pop
  end

  def dock bike
    if @bikes.size >= @capacity
      raise "Station is full"
    else
      @bikes.push bike
    end
  end
end
