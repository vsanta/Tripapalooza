require 'spec_helper'

describe "trips/show.html.haml" do
  before(:each) do
    @trip = assign(:trip, stub_model(Trip))
  end

  it "renders attributes in <p>" do
    render
  end
end
