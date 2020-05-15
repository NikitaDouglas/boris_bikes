require_relative '../lib/docking_station'
require_relative '../lib/bike'
describe DockingStation do
  subject(:station) { DockingStation.new }
  it "should respond to #release_bike" do
    expect(station).to respond_to(:release_bike)
  end

  it "should release a bike after #release_bike is called" do
    station.dock(Bike.new)
    expect(station.release_bike).to be_an_instance_of(Bike)
  end

  it "should not release a broken bike" do
    bike = Bike.new
    bike.report_broken
    station.dock(bike)
    expect{ station.release_bike }.to raise_error("There are no bikes available.")
  end

  it "should respond to #dock" do
    expect(station).to respond_to(:dock)
  end

  it "should be happy to dock a thing" do
    # expect{ station.dock(Bike.new) }.not_to raise_error(ArgumentError)
    expect(station).to respond_to(:dock).with(1).argument
  end

  it "can show whether a bike is there or not" do
    expect(station).to respond_to(:bike_check)
  end

  it "#release_bike raises an error when there are no bikes" do
    expect{ station.release_bike }.to raise_error("There are no bikes available.")
  end

  it "#dock raises an error when the station is full" do
    DockingStation::DEFAULT_CAPACITY.times { station.dock(Bike.new) }
    expect{ station.dock(Bike.new) }.to raise_error("This station is full.")
  end

  it "should accept a capacity when called" do
    expect(DockingStation).to respond_to(:new).with(1).argument
  end

  it "should have a default capacity of 20" do
    expect(station.capacity).to eq(20)
  end


end
