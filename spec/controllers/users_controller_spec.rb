require 'spec_helper'

describe UsersController do

  before(:each) do
    #
    # Define @base_title here.
    #

    @base_title = "Ruby on Rails Tutorial Sample App"
  end

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end

    #it "should have the right title" do
    #    get 'new'
    #  response.should have_selector("title",
    #      :content => @base_title + " | Sign up")
    #end
  end

  describe "GET 'show'" do

    before(:each) do
      @user = Factory(:user)
    end

    it "should be successful" do
      get :show, :id => @user
      response.should be_success
    end

    it "should find the right user" do
      get :show, :id => @user
      assigns(:user).should == @user
    end
  end

end
