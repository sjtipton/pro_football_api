require 'spec_helper'

describe GamesController do

  describe "routing" do

    before(:each) do
      @id = SecureRandom.random_number(1e2.to_i)
    end

    context "when valid" do

      it "recognizes and properly generates a route to games#index when supplying: '/api/v1/games'" do
        { get: "/api/v1/games" }.should route_to("games#index", format: :json)
      end

      it "recognizes and properly generates an alias route to games#index when supplying: '/api/v1/schedule'" do
        { get: "/api/v1/schedule" }.should route_to("games#index", format: :json)
      end

      it "recognizes and properly generates a route to games#show when supplying: '/api/v1/games/:id'" do
        { get: "/api/v1/games/#{@id}" }.should route_to("games#show", id: "#{@id}", format: :json)
      end
    end

    context "when invalid" do

      context "given a non-integer :id for an otherwise valid route" do

        it ":get '/api/v1/games/one' should not be routable" do
          { get: "/api/v1/games/one" }.should_not be_routable
        end
      end
    end
  end
end
