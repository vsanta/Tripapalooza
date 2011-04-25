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

  describe "post 'create'" do

    before() do
      Traveler.destroy_all
      @request.env['HTTP_REFERER'] = 'http://test.com/sessions/new'
      @traveler = {:nick => "belrodrigues", :email => "bel@tripapalooza.net", :password => "rightpassword"}
    end

    it "should be successful" do
      post 'create', :traveler => @traveler
      response.should redirect_to(:back, traveler: @traveler)
      flash[:notice].should == 'Welcome to Tripapalooza!!!'
    end

    it "should return errors" do
      @traveler[:nick] = nil
      @traveler[:email] = nil
      @traveler[:password] = nil
      post 'create', :traveler => @traveler
      response.should redirect_to(:back, traveler: @traveler)
      assert_equal(4, assigns[:traveler].errors.count)
    end

  end

end
