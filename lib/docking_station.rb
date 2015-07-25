require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    @temp = @bikes.select { |bike| bike.working? }
    fail 'No bikes available' if @temp.empty?
    bike_to_release = @temp.pop
    @bikes.delete(bike_to_release)
    bike_to_release
  end

  def dock(bike)
    if full?
      fail 'Station is full'
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
