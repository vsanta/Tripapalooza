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

    it "should CREATE Traveler SUCCESSFULLY" do
      post 'create', :traveler => { nick: "isabel", email: "bel@tripapalooza.net", password: "123456" }
      response.should redirect_to(controller: "landing", action: "index")
      flash[:notice].should == 'Welcome to Tripapalooza!!!'
    end

    it "should return error when NOT INPUTTING a Traveler's NICK" do
      post 'create', :traveler => { email: "bel@tripapalooza.net", password: "123456" }
      response.should redirect_to(controller: "landing", action: "index")
      assert_equal(1, assigns[:traveler].errors.count)
    end

    it "should return error when NOT INPUTTING a Traveler's E-MAIL" do
      post 'create', :traveler => { nick: "isabel", password: "123456" }
      response.should redirect_to(controller: "landing", action: "index")
      assert_equal(1, assigns[:traveler].errors.count)
    end

    it "should return error when NOT INPUTTING a Traveler's PASSWORD" do
       post 'create', :traveler => { nick: "isabel", email: "bel@tripapalooza.net" }
      response.should redirect_to(controller: "landing", action: "index")
      assert_equal(1, assigns[:traveler].errors.count)
    end

    it "should return error when inputting a Traveler's NICK with LENGTH LESS than 3" do
      post 'create', :traveler => { nick: "aa", email: "bel@tripapalooza.net", password: "123456" }
      response.should redirect_to(controller: "landing", action: "index")
      assert_equal(1, assigns[:traveler].errors.count)
    end

    it "should return error when inputting a Traveler's PASSWORD with LENGTH LESS than 6" do
      post 'create', :traveler => { nick: "isabel", email: "bel@tripapalooza.net", password: "12345" }
      response.should redirect_to(controller: "landing", action: "index")
      assert_equal(1, assigns[:traveler].errors.count)
    end

    it "should return error when inputting a Traveler's NICK with LENGTH OVER 20" do
      post 'create', :traveler => { nick: "aaaaaaaaaaaaaaaaaaaaa", email: "bel@tripapalooza.net", password: "123456" }
      response.should redirect_to(controller: "landing", action: "index")
      assert_equal(1, assigns[:traveler].errors.count)
    end

    it "should return error when inputting a Traveler's E-MAIL with LENGTH OVER 50" do
      post 'create', :traveler => { nick: "aaaa", email: "belAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA@tripapalooza.com.br", password: "ABCDEF" }
      response.should redirect_to(controller: "landing", action: "index")
      assert_equal(1, assigns[:traveler].errors.count)
    end

    it "should return error when inputting a Traveler's PASSWORD with LENGTH OVER 20" do
      post 'create', :traveler => { nick: "isabel", email: "bel@tripapalooza.net", password: "123456789012345678901" }
      response.should redirect_to(controller: "landing", action: "index")
      assert_equal(1, assigns[:traveler].errors.count)
    end

    it "should return error when inputting a Traveler's NICK with BLANK SPACE" do
      post 'create', :traveler => { nick: "aaa aaa", email: "bel@tripapalooza.net", password: "123456" }
      response.should redirect_to(controller: "landing", action: "index")
      assert_equal(1, assigns[:traveler].errors.count)
    end

    it "should return error when inputting a Traveler's PASSWORD with BLANK SPACE" do
      post 'create', :traveler => { nick: "isabel", email: "bel@tripapalooza.net", password: "123 456" }
      response.should redirect_to(controller: "landing", action: "index")
      assert_equal(1, assigns[:traveler].errors.count)
    end

    it "should return error when inputting a Traveler's NICK that is already BEING USED" do
      post 'create', :traveler => { nick: "isabel", email: "bel@tripapalooza.net", password: "123456" }
      post 'create', :traveler => { nick: "ISABEL", email: "aaaaa@tripapalooza.net", password: "123456" }
      assert_equal(1, assigns[:traveler].errors.count)
    end

    it "should return error when inputting a Traveler's E-MAIL that is already BEING USED" do
      post 'create', :traveler => { nick: "aaaaa", email: "bel@tripapalooza.net", password: "123456" }
      post 'create', :traveler => { nick: "aaaaaa", email: "BEL@tripapalooza.net", password: "123456" }
      assert_equal(1, assigns[:traveler].errors.count)
    end

    it "should return error when inputting an INVALID Traveler's E-MAIL" do
      post 'create', :traveler => { nick: "aaaaa", email: "emailinvalido", password: "123456" }
      assert_equal(1, assigns[:traveler].errors.count)
    end

  end


end
