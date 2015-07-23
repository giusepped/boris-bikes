require_relative '../lib/docking_station'

describe DockingStation do
  it {is_expected.to respond_to(:release_bike)}

  it {is_expected.to respond_to(:dock).with(1).argument}

  it 'has a default capacity constant' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it 'releases working bikes' do
    subject.dock Bike.new
    bike = subject.release_bike
    expect(bike).to be_working
  end
  it "only accepts bikes up to a max capacity" do
    subject.capacity.times {subject.dock Bike.new}
    expect{subject.dock Bike.new}.to raise_error "Station is full"
  end


  describe "#release_bike" do
    it "release bike raises an error" do
      expect{subject.release_bike}.to raise_error "No bikes available"
    end
    it "release bike only if working, otherwise raise an error" do
      bike = Bike.new
      bike.report_broken
      subject.dock bike
      expect{subject.release_bike}.to raise_error "Bike is broken"
    end
  end
end
