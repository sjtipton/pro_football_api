require 'spec_helper'

describe TeamGamesController do

  describe "routing" do

  	before(:each) do
  		@id = SecureRandom.random_number(1e2.to_i)
  	end

  	context "when valid" do

	    it "recognizes and properly generates a route to team_games#index when supplying: '/api/v1/teams/:id/games'" do
	      { get: "/api/v1/teams/#{@id}/games" }.should route_to("team_games#index", id: "#{@id}", format: :json)
	    end

      it "recognizes and properly generates a route to team_games#index when supplying: '/api/v1/teams/:id/schedule'" do
        { get: "/api/v1/teams/#{@id}/schedule" }.should route_to("team_games#index", id: "#{@id}", format: :json)
      end
	  end

    context "when invalid" do

    	context "given a non-integer :id for an otherwise valid route" do

    		it ":get '/api/v1/teams/one/games' should not be routable" do
    			{ get: "/api/v1/teams/one/games" }.should_not be_routable
    		end

        it ":get '/api/v1/teams/one/schedule' should not be routable" do
          { get: "/api/v1/teams/one/schedule" }.should_not be_routable
        end
    	end
    end
  end
end
