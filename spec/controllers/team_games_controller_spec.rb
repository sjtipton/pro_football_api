require 'spec_helper'

describe TeamGamesController do
  render_views

  before(:each) do
    @teams = []
    @teams << FactoryGirl.create(:team, name: "Carolina Panthers")
    @teams << FactoryGirl.create(:team, name: "Seattle Seahawks")
    @game = FactoryGirl.create(:game, home_team_id: @teams.first.id,
                                      away_team_id: @teams.second.id)
  end

  context "when authenticated" do

    before(:each) do
      @user = FactoryGirl.create(:user)
      @user.confirm!
    end

    describe "GET 'index'" do

      before(:each) do
        get :index, id: @teams.first.id, format: :json, auth_token: @user.authentication_token
      end

      it "should be successful" do
        response.should be_success
      end

      it "should assign @games" do
        assigns(:games).should be_an(ActiveRecord::Relation)
        assigns(:games).should_not be_empty
        assigns(:games).sample.should be_a(Game)
        assigns(:games).sample.home_team_id.should eq @teams.first.id
        assigns(:games).sample.away_team_id.should eq @teams.second.id
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

      it "should not assign @games" do
        assigns(:games).should be_nil
      end
    end
  end
end
