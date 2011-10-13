require 'spec_helper'

describe UsersController do

    #ALWAYS add a render_views to each controller rspec class in order for
    #things to not give you errors such as
    #response.should have_selector("title",....
  render_views

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

    it "should have the right title" do
        get 'new'
      response.should have_selector("title",
          :content => @base_title + " | Sign up")
    end
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

    it "should have the right title" do
      get :show, :id => @user
      response.should have_selector("title", :content => @base_title + " | " + @user.name)
    end

    it "should include the user's name" do
      get :show, :id => @user
      response.should have_selector("h1", :content => @user.name)
    end

    it "should have a profile image" do
      get :show, :id => @user
      response.should have_selector("h1>img", :class => "gravatar")
    end
  end

end
