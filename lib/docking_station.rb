require_relative "bike"

class DockingStation

  attr_reader :bike_check, :capacity

  def initialize(cap = DEFAULT_CAPACITY)
    @bike_check = []
    @capacity = cap
  end

  DEFAULT_CAPACITY = 20

  def release_bike
    unless empty?
      @bike_check.pop  ## possibly pops a broken bike
    else
      fail("There are no bikes available.")
    end
  end

  def dock(bike)
    if full?
      fail("This station is full.")
    else
      ## split list into two, one for working, one for broken
       @bike_check << bike
    end
  end

  private
  def full?
    @bike_check.length == DEFAULT_CAPACITY
  end

  def empty?
    n = 0
    @bike_check.each { |bike| n += 1 if bike.working? }
    n == 0
  end
end
