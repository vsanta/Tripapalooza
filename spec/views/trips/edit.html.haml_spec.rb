require 'spec_helper'

describe "trips/edit.html.haml" do
  before(:each) do
    @trip = assign(:trip, stub_model(Trip))
  end

  it "renders the edit trip form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => trip_path(@trip), :method => "post" do
    end
  end
end
