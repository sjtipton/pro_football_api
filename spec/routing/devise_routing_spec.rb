require "spec_helper"

describe "devise routing" do

  context "when valid" do

    it "recognizes and properly generates a route to devise/sessions#new when supplying: '/sign_in'" do
      { get: "/sign_in" }.should route_to("devise/sessions#new")
    end

    it "recognizes and properly generates a route to devise/sessions#destroy when supplying: '/sign_out'" do
      { get: "/sign_out" }.should route_to("devise/sessions#destroy")
    end
  end

  context "when invalid" do

    it "get '/sign_up' should not be routable" do
      { get: "/sign_up" }.should_not be_routable
    end

    it "post '/users/registrations' should not be routable" do
      { post: "/users/registrations" }.should_not be_routable
    end
  end
end