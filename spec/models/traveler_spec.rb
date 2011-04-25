require "spec_helper"

describe Traveler do

  before(:each) do
      @traveler = Factory(:traveler)
      @traveler.should have(:no).errors
  end

  describe "authenticate method" do

    it "should return nil on email/password mismatch" do
      wrong_password_traveler = Traveler.authenticate(@traveler[:nick], "wrongpass")
      wrong_password_traveler.should be_nil
    end

    it "should return nil on email/password mismatch" do
      wrong_password_traveler = Traveler.authenticate("isa", "rightpassword")
      wrong_password_traveler.should be_nil
    end

    it "should return the traveler on email/password match" do
      matching_traveler = Traveler.authenticate(@traveler[:nick], "rightpassword")
      matching_traveler.should == @traveler
    end
  end

  describe "validations - " do

    describe "nick" do

      it "should return error when not present" do
        @traveler.nick = nil
        @traveler.should have(1).error_on(:nick)
        @traveler.nick = ''
        @traveler.should have(1).error_on(:nick)
      end

      it "should return error when over max length" do
        @traveler.nick = "aaaaaaaaaaaaaaaaaaaaa"
        @traveler.should have(1).error_on(:nick)
      end

      it "should return error when have blank space" do
       @traveler.nick = "aaa aaa"
       @traveler.should have(1).error_on(:nick)
      end

      it "should return error when already being used" do
        traveler = Traveler.new(@traveler.attributes)
        traveler.should have(1).error_on(:nick)
      end

    end

    describe "email" do

      it "should return error when not present" do
        @traveler.email = nil
        @traveler.should have(1).error_on(:email)
        @traveler.email = ''
        @traveler.should have(1).error_on(:email)
      end

      it "should return error when over max length" do
        @traveler.email = "belAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA@tripapalooza.com.br"
        @traveler.should have(1).error_on(:email)
      end

      it "should return error when is already being used" do
        traveler = Traveler.new(@traveler.attributes)
        traveler.should have(1).error_on(:email)
      end

      it "should return error when is invalid" do
        @traveler.email = "emailinvalido"
        @traveler.should have(1).error_on(:email)
      end

    end

    describe "password" do

      it "should return error when not present" do
        @traveler.password = nil
        @traveler.should have(1).error_on(:password)
        @traveler.password = ''
        @traveler.should have(1).error_on(:password)
      end

      it "should return error when length is less than expected" do
        @traveler.password = '12345'
        @traveler.should have(1).error_on(:password)
      end

      it "should return error when length is over than expected" do
        @traveler.password = '123456789012345678901'
        @traveler.should have(1).error_on(:password)
      end

      it "should return error when has blank space" do
        @traveler.password = '123 456'
        @traveler.should have(1).error_on(:password)
      end

    end

    describe "hashed_password" do
      it "should return error when not present" do
        traveler = Traveler.create(:nick => 'nick', :email => 'email@email.com')
        traveler.should have(1).error_on(:hashed_password)
      end

    end


  end




end