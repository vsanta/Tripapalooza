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
      traveler = { nick: "isabel", email: "bel@tripapalooza.net", password: "123456" }
      post 'create', :traveler => traveler
      response.should redirect_to(controller: "landing", action: "index", traveler: traveler)
      flash[:notice].should == 'Welcome to Tripapalooza!!!'
    end

    describe "validations for Traveler's nickname" do
      it "should return error when NOT INPUTTING a Traveler's NICK" do
        traveler = { email: "bel@tripapalooza.net", password: "123456" }
        post 'create', :traveler => traveler
        response.should redirect_to(controller: "landing", action: "index", traveler: traveler)
        assert_equal(1, assigns[:traveler].errors.count)
      end
      it "should return error when inputting a Traveler's NICK with LENGTH OVER 20" do
        traveler = { nick: "aaaaaaaaaaaaaaaaaaaaa", email: "bel@tripapalooza.net", password: "123456" }
        post 'create', :traveler => traveler
        response.should redirect_to(controller: "landing", action: "index", traveler: traveler)
        assert_equal(1, assigns[:traveler].errors.count)
      end
      it "should return error when inputting a Traveler's NICK with BLANK SPACE" do
        traveler = { nick: "aaa aaa", email: "bel@tripapalooza.net", password: "123456" }
        post 'create', :traveler => traveler
        response.should redirect_to(controller: "landing", action: "index", traveler: traveler)
        assert_equal(1, assigns[:traveler].errors.count)
      end
      it "should return error when inputting a Traveler's NICK that is already BEING USED" do
        post 'create', :traveler => { nick: "isabel", email: "bel@tripapalooza.net", password: "123456" }
        post 'create', :traveler => { nick: "ISABEL", email: "aaaaa@tripapalooza.net", password: "123456" }
        assert_equal(1, assigns[:traveler].errors.count)
      end
    end

    describe "validations for Traveler's email" do

      it "should return error when NOT INPUTTING a Traveler's E-MAIL" do
        traveler =  { nick: "isabel", password: "123456" }
        post 'create', :traveler => traveler
        response.should redirect_to(controller: "landing", action: "index", traveler: traveler)
        assert_equal(1, assigns[:traveler].errors.count)
      end
      it "should return error when inputting a Traveler's E-MAIL with LENGTH OVER 50" do
        traveler = { nick: "aaaa", email: "belAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA@tripapalooza.com.br", password: "ABCDEF" }
        post 'create', :traveler => traveler
        response.should redirect_to(controller: "landing", action: "index", traveler: traveler)
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

    describe "validations for Traveler's password" do
      it "should return error when NOT INPUTTING a Traveler's PASSWORD" do
        traveler =  { nick: "isabel", email: "bel@tripapalooza.net" }
        post 'create', :traveler => traveler
        response.should redirect_to(controller: "landing", action: "index", traveler: traveler)
        assert_equal(1, assigns[:traveler].errors.count)
      end

      it "should return error when inputting a Traveler's PASSWORD with LENGTH LESS than 6" do
        traveler =  { nick: "isabel", email: "bel@tripapalooza.net", password: "12345" }
        post 'create', :traveler => traveler
        response.should redirect_to(controller: "landing", action: "index", traveler: traveler)
        assert_equal(1, assigns[:traveler].errors.count)
      end


      it "should return error when inputting a Traveler's PASSWORD with LENGTH OVER 20" do
        traveler ={ nick: "isabel", email: "bel@tripapalooza.net", password: "123456789012345678901" }
        post 'create', :traveler => traveler
        response.should redirect_to(controller: "landing", action: "index", traveler: traveler)
        assert_equal(1, assigns[:traveler].errors.count)
      end


      it "should return error when inputting a Traveler's PASSWORD with BLANK SPACE" do
        traveler = { nick: "isabel", email: "bel@tripapalooza.net", password: "123 456" }
        post 'create', :traveler => traveler
        response.should redirect_to(controller: "landing", action: "index", traveler: traveler)
        assert_equal(1, assigns[:traveler].errors.count)
      end

    end

  end

  describe "GET 'checkin_show'" do
    it "should be successful" do
      get 'checkin_show'
      response.should be_success
    end
  end




end
