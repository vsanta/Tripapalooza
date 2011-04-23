require "spec_helper"

describe Traveler do

  describe "authenticate method" do

    before() do
      traveler = Factory(:traveler)
      Traveler.destroy_all
      Traveler.create!(:nick => traveler[:nick], :email => traveler[:email], :password => traveler[:password])
      @traveler = Traveler.find_by_nick traveler[:nick]
    end

    it "should return nil on email/password mismatch" do
      wrong_password_traveler = Traveler.authenticate(@traveler[:nick], "wrongpass")
      wrong_password_traveler.should be_nil
    end

    it "should return nil on email/password mismatch" do
      wrong_password_traveler = Traveler.authenticate("isa", @traveler[:password])
      wrong_password_traveler.should be_nil
    end

    it "should return the traveler on email/password match" do
      matching_traveler = Traveler.authenticate(@traveler[:nick], @traveler[:password])
      matching_traveler.should == @traveler
    end
  end
end