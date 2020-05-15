require_relative "bike"

class DockingStation

  attr_reader :bike_check, :capacity

  def initialize(cap = DEFAULT_CAPACITY)
    @bike_check = []
    @capacity = cap
  end

  DEFAULT_CAPACITY = 20

  #function that iterates through bike_check, finds the first working bike and returns that
  #if no working bikes then return false

  def find_working_bike
    @bike_check.each_with_index do |bike, i|
      if bike.working?
        true
      else
        false
      end
    end
  end


  def release_bike
    if find_working_bike
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
    @bike_check.empty?
    #n = 0
    #@bike_check.each { |bike| n += 1 if bike.working? }
    #n == 0
  end
end
