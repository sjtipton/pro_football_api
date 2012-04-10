require 'spec_helper'

describe HomeController do

  describe "routing" do

    it "recognizes and properly generates a root route to home#index when supplying: '/'" do
      { get: "/" }.should route_to("home#index")
    end
  end
end
