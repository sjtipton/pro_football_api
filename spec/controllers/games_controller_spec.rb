require 'spec_helper'

describe GamesController do
  render_views

  before(:each) do
    @games = FactoryGirl.create_list(:game, 16, week: 1)
    @games << FactoryGirl.create_list(:game, 16)
  end

  context "when authenticated" do

    before(:each) do
      @user = FactoryGirl.create(:user)
      @user.confirm!
    end

    describe "GET 'index'" do

      context "when not passing optional params for a particular week" do

        before(:each) do
          get :index, format: :json, auth_token: @user.authentication_token
        end

        it "should be successful" do
          response.should be_success
        end

        it "should assign @games" do
          assigns(:games).should be_an(ActiveRecord::Relation)
          assigns(:games).should_not be_empty
          assigns(:games).sample.should be_a(Game)
          (1..17).to_a.should include assigns(:games).sample.week
        end
      end

      context "when passing optional params for a particular week" do

        before(:each) do
          get :index, week: 1, format: :json, auth_token: @user.authentication_token
        end

        it "should be successful" do
          response.should be_success
        end

        it "should assign @games" do
          assigns(:games).should be_an(ActiveRecord::Relation)
          assigns(:games).should_not be_empty
          assigns(:games).sample.should be_a(Game)
          assigns(:games).sample.week.should be(1)
        end
      end
    end

    describe "GET 'show'" do

      before(:each) do
        get :show, id: @games.first.id, format: :json, auth_token: @user.authentication_token
      end

      it "should be successful" do
        response.should be_success
      end

      it "should assign @game" do
        assigns(:game).should be_a(Game)
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

    describe "GET 'show'" do

      before(:each) do
        get :show, id: @games.first.id, format: :json
      end

      it "should not be successful" do
        response.should_not be_success
      end

      it "should not assign @game" do
        assigns(:game).should be_nil
      end
    end
  end
end
