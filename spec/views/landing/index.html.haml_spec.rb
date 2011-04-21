require 'spec_helper'

describe "landing/index.html.haml" do

  it "should render traveler registration form" do
    render
    document = Nokogiri::HTML(rendered)
    registration_form = document.xpath("//div[@id='registration']")
    registration_form.should_not be_nil
    registration_form.should_not be_empty
  end
end
