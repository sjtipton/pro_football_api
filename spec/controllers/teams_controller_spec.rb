require 'spec_helper'

describe TeamsController do
  render_views

  before(:each) do
    @team = FactoryGirl.create(:team)
  end

  context "when authenticated" do

    before(:each) do
      @user = FactoryGirl.create(:user)
      @user.confirm!
    end

    describe "GET 'index'" do

      before(:each) do
        get :index, format: :json, auth_token: @user.authentication_token
      end

      it "should be successful" do
        response.should be_success
      end

      it "should assign @teams" do
        assigns(:teams).should be_an(Array)
        assigns(:teams).should_not be_empty
        assigns(:teams).sample.should be_a(Team)
      end
    end

    describe "GET 'show'" do

      before(:each) do
        get :show, id: @team.id, format: :json, auth_token: @user.authentication_token
      end

      it "should be successful" do
        response.should be_success
      end

      it "should assign @team" do
        assigns(:team).should be_a(Team)
      end
    end
  end

  context "when not authenticated" do

    describe "GET 'index'" do

      before(:each) do
        get :index, format: :json
      end

      it "should not be successful" do
        response.should_not be_success
      end

      it "should not assign @teams" do
        assigns(:teams).should be_nil
      end
    end

    describe "GET 'show'" do

      before(:each) do
        get :show, id: @team.id, format: :json
      end

      it "should not be successful" do
        response.should_not be_success
      end

      it "should not assign @team" do
        assigns(:team).should be_nil
      end
    end
  end
end
