require 'spec_helper'

describe "Teams feature", type: :request do

  before(:each) do
    @team = FactoryGirl.create(:team)
  end

  context "when authenticated" do

    before(:each) do
      @user = FactoryGirl.create(:user)
      @user.confirm!
    end

    describe "showing an index of Teams" do

      before(:each) do
        visit teams_path(auth_token: @user.authentication_token)
      end

      it "response should not contain 'team' node" do
        page.should_not have_content "team"
      end

      it "response should contain 'id' node with proper value" do
        page.should have_content @team.id.to_json
      end

      it "response should contain 'name' node with proper value" do
        page.should have_content @team.name.to_json
      end

      it "response should contain 'nickname' node with proper value" do
        page.should have_content @team.nickname.to_json
      end

      it "response should contain 'abbreviation' node with proper value" do
        page.should have_content @team.abbreviation.to_json
      end

      it "response should contain 'location' node with proper value" do
        page.should have_content @team.location.to_json
      end

      it "response should contain 'conference' node with proper value" do
        page.should have_content @team.conference.to_json
      end

      it "response should contain 'division' node with proper value" do
        page.should have_content @team.division.to_json
      end
    end

    describe "showing a Team" do

      before(:each) do
        get team_path(id: @team.id, auth_token: @user.authentication_token)
        @body = JSON.parse(response.body)
      end

      it "response should not contain 'team' node" do
        @body.should_not include "team"
      end

      it "response should contain 'id' node with proper value" do
        @body["id"].should eq @team.id
      end

      it "response should contain 'name' node with proper value" do
        @body["name"].should eq @team.name
      end

      it "response should contain 'nickname' node with proper value" do
        @body["nickname"].should eq @team.nickname
      end

      it "response should contain 'abbreviation' node with proper value" do
        @body["abbreviation"].should eq @team.abbreviation
      end

      it "response should contain 'location' node with proper value" do
        @body["location"].should eq @team.location
      end

      it "response should contain 'conference' node with proper value" do
        @body["conference"].should eq @team.conference
      end

      it "response should contain 'division' node with proper value" do
        @body["division"].should eq @team.division
      end
    end
  end
end