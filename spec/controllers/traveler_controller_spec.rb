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

    it "should create Traveler successfully" do
      post 'create', :traveler => { nick: "isabel", email: "bel@tripapalooza.net", password: "123456" }
      response.should redirect_to(controller: "landing", action: "index")
      flash[:notice].should == 'Welcome to Tripapalooza!!!'
    end

    it "should return creation error when not inputting a Traveler's e-mail" do
      post 'create', :traveler => { email: "bel@tripapalooza.net", password: "123456" }
      response.should redirect_to(controller: "landing", action: "index")
      assert_equal(1, assigns[:traveler].errors.count)
    end


    it "should return creation error when inputting a Traveler's nick with length less than 3" do
      post 'create', :traveler => { nick: "aa", email: "bel@tripapalooza.net", password: "123456" }
      response.should redirect_to(controller: "landing", action: "index")
      assert_equal(1, assigns[:traveler].errors.count)
    end

    it "should return creation error when inputting a Traveler's nick with length more than 20" do
      post 'create', :traveler => { nick: "aaaaaaaaaaaaaaaaaaaaa", email: "bel@tripapalooza.net", password: "123456" }
      response.should redirect_to(controller: "landing", action: "index")
      assert_equal(1, assigns[:traveler].errors.count)
    end

    it "should return creation error when inputting a Traveler's nick with blank space" do
      post 'create', :traveler => { nick: "aaa aaa", email: "bel@tripapalooza.net", password: "123456" }
      response.should redirect_to(controller: "landing", action: "index")
      assert_equal(1, assigns[:traveler].errors.count)
    end
  end


end
