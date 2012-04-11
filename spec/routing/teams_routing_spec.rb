require 'spec_helper'

describe TeamsController do

  describe "routing" do

  	before(:each) do
  		@id = SecureRandom.random_number(1e2.to_i)
  	end

  	context "when valid" do

	    it "recognizes and properly generates a route to teams#index when supplying: '/api/v1/teams'" do
        { get: "/api/v1/teams" }.should route_to("teams#index")
	    end

	    it "recognizes and properly generates a route to teams#show when supplying: '/api/v1/teams/:id'" do
	      { get: "/api/v1/teams/#{@id}" }.should route_to("teams#show", id: "#{@id}")
	    end
	  end

    context "when invalid" do

    	context "given a non-integer :id for an otherwise valid route" do

    		it ":get '/api/v1/teams/one' should not be routable" do
    			{ get: "/api/v1/teams/one" }.should_not be_routable
    		end
    	end
    end
  end
end
