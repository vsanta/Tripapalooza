require 'spec_helper'

describe TravelerController do

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should redirect_to(action: "new")
    end
  end

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end

  describe "POST 'create'" do
    it "should be successful" do
      post 'create', :traveler => { nick: "isabel", email: "bel@tripapalooza.net", password: "123456" }
      flash[:notice].should == 'Welcome to Tripapalooza!!!'
      response.should redirect_to(action: "new")
    end
  end

end
