require "rspec"

describe ApplicationHelper do
  describe "autotab" do
    it "should keep incrementing tab count" do
      helper.autotab.should be 1
      helper.autotab.should be 2
      helper.autotab.should be 3
    end
  end
end

describe GeocoderHelper do
  describe "get_my_current_location_marker" do
    it "should return coordinates for New York if it cant get it though my ip" do
      coordinates = helper.get_my_current_location
      coordinates.should == [40.7143528, -74.0059731]
    end
    it "should return coordinates for city and country from the request" do
      pending "need to learn how to mock the request so we can make sure the values of country and city are as expected"
    end
  end
  describe "get_my_current_location_marker" do
    before(:each) do
      @map = Cartographer::Gmap.new('map')
    end
    it "should set maps center to my current location" do
      helper.get_my_current_location_marker
      @map.center.should == helper.get_my_current_location
    end
    it "should return one marker for my current location" do
      marker = helper.get_my_current_location_marker
      marker.position.should == helper.get_my_current_location

    end
  end
end

describe GoogleMapsHelper do
  describe "map_init" do
    before(:each) do
      @map = nil
    end
    it "should create a new map with default zoom" do
      @map = helper.map_init
      @map.zoom.should == 10
    end
    it "should create a new map with provided zoom" do
      @map = helper.map_init 1
      @map.zoom.should == 1
    end
  end
end

