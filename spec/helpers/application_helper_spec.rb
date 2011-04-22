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


