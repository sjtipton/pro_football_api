require 'spec_helper'

describe GamesController do
	render_views

	before(:each) do
		@game = FactoryGirl.create(:game)
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

			it "should assign @games" do
				assigns(:games).should be_an(ActiveRecord::Relation)
				assigns(:games).should_not be_empty
				assigns(:games).sample.should be_a(Game)
			end
		end

		describe "GET 'show'" do

			before(:each) do
				get :show, id: @game.id, format: :json, auth_token: @user.authentication_token
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
				get :show, id: @game.id, format: :json
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