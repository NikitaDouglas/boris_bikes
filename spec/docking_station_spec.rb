require_relative '../lib/docking_station'

describe DockingStation do

  it "should respond to #release_bike" do
    expect(DockingStation.new).to respond_to(:release_bike)
  end
end
