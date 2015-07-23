require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    raise "No bikes available" if empty?
    bike = @bikes.pop
    if bike.working?
      bike
    else
      raise "Bike is broken"
    end
  end

  def dock bike
    if full?
      raise "Station is full"
    else
      @bikes.push bike
    end
  end

  def empty?
    @bikes.empty?
  end

  def full?
    @bikes.size >= @capacity
  end

end
