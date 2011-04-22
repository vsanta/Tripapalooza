require 'spec_helper'
require 'date'

describe Trip do
  describe "has minimal data for a Trip" do
    before(:each) do
      @trip = Trip.new()
      @trip.destination = "New York"
      @trip.destination_lat = 40.77
      @trip.destination_lon =  73.98
      @today = Date.today()
      @trip.start = @today
      @trip.end = @today.next_month()
      @trip.name = "My Cool Trip to NYC"
    end
    it "should have a name" do
      @trip.name = nil
      @trip.save.should raise_error
      @trip.name = ""
      @trip.save.should raise_error
    end
    describe "destination information" do
      it "should have destination's name" do
        @trip.destination = nil
        @trip.save.should raise_error
        @trip.destination = ""
        @trip.save.should raise_error
      end
      it "should have lat and lon based on destination" do
        pending
      end
    end
    describe "date information" do
      it "should have start date before of end date" do
        @trip.end = @today
        @trip.start = @today.next_month()
        @trip.save.should raise_error
      end
    end
  end
end
