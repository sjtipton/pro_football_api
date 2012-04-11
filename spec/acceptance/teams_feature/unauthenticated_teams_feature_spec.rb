require 'spec_helper'

describe "Teams feature", type: :request do

  before(:each) do
    @team = FactoryGirl.create(:team)
  end

  context "when not authenticated" do

    describe "showing an index of Teams" do

      before(:each) do
        visit teams_path
      end

      it "response should not contain 'team' node" do
        page.should_not have_content "team"
      end

      it "response should contain 'error' node with error message" do
        page.should have_content ("You need to sign in or sign up before continuing.")
      end

      it "response should not contain 'id' node with proper value" do
        page.should_not have_content @team.id.to_json
      end

      it "response should not contain 'name' node with proper value" do
        page.should_not have_content @team.name.to_json
      end

      it "response should not contain 'nickname' node with proper value" do
        page.should_not have_content @team.nickname.to_json
      end

      it "response should not contain 'abbreviation' node with proper value" do
        page.should_not have_content @team.abbreviation.to_json
      end

      it "response should not contain 'location' node with proper value" do
        page.should_not have_content @team.location.to_json
      end

      it "response should not contain 'conference' node with proper value" do
        page.should_not have_content @team.conference.to_json
      end

      it "response should not contain 'division' node with proper value" do
        page.should_not have_content @team.division.to_json
      end
    end

    describe "showing a Team" do

      before(:each) do
        get team_path(@team.id)
        @body = JSON.parse(response.body)
      end

      it "response should not contain 'team' node" do
        @body.should_not include "team"
      end

      it "response should contain 'error' node with error message" do
        @body["error"].should eq ("You need to sign in or sign up before continuing.")
      end

      it "response should not contain 'id' node with proper value" do
        @body["id"].should be_nil
      end

      it "response should not contain 'name' node with proper value" do
        @body["name"].should be_nil
      end

      it "response should not contain 'nickname' node with proper value" do
        @body["nickname"].should be_nil
      end

      it "response should not contain 'abbreviation' node with proper value" do
        @body["abbreviation"].should be_nil
      end

      it "response should not contain 'location' node with proper value" do
        @body["location"].should be_nil
      end

      it "response should not contain 'conference' node with proper value" do
        @body["conference"].should be_nil
      end

      it "response should not contain 'division' node with proper value" do
        @body["division"].should be_nil
      end
    end
  end
end