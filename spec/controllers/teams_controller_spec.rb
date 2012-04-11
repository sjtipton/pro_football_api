require 'spec_helper'

describe TeamsController do
	render_views

	before(:each) do
		@team = FactoryGirl.create(:team)
	end

	describe "GET 'index'" do

		before(:each) do
			get :index, format: :json
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
			get :show, id: @team.id, format: :json
		end

		it "should be successful" do
			response.should be_success
		end

		it "should assign @team" do
			assigns(:team).should be_a(Team)
		end
	end
end