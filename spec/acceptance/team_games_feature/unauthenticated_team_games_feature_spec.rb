require 'spec_helper'

describe "Team Games feature", type: :request do

  before(:each) do
    @teams = []
    2.times { @teams << FactoryGirl.create(:team) }
    @game = FactoryGirl.create(:game, home_team_id: @teams.first.id,
                                      away_team_id: @teams.second.id)
  end

  context "when not authenticated" do

    describe "showing an index of Team Games" do

      context "when visiting the team_games_path route" do

        before(:each) do
          visit team_games_path(id: @teams.first.id)
        end

        it "response should not contain 'game' node" do
          page.should_not have_content "game"
        end

        it "response should contain 'error' node with error message" do
          page.should have_content ("You need to sign in or sign up before continuing.")
        end

        it "response should not contain 'id' node with proper value" do
          page.should_not have_content @game.id.to_json
        end

        it "response should not contain 'label' node with proper value" do
          page.should_not have_content @game.label.to_json
        end

        it "response should not contain 'season' node with proper value" do
          page.should_not have_content @game.season.to_json
        end

        it "response should not contain 'stadium' node with proper value" do
          page.should_not have_content @game.stadium.to_json
        end

        it "response should not contain 'week' node with proper value" do
          page.should_not have_content @game.week.to_json
        end

        it "response should not contain 'home_team_id' node with proper value" do
          page.should_not have_content @game.home_team_id.to_json
        end

        it "response should not contain 'away_team_id' node with proper value" do
          page.should_not have_content @game.away_team_id.to_json
        end

        it "response should not contain 'played_at' node with proper value" do
          page.should_not have_content @game.played_at.to_json
        end
      end

      context "when visiting the team_schedule_path route" do

        before(:each) do
          visit team_schedule_path(id: @teams.first.id)
        end

        it "response should not contain 'game' node" do
          page.should_not have_content "game"
        end

        it "response should contain 'error' node with error message" do
          page.should have_content ("You need to sign in or sign up before continuing.")
        end

        it "response should not contain 'id' node with proper value" do
          page.should_not have_content @game.id.to_json
        end

        it "response should not contain 'label' node with proper value" do
          page.should_not have_content @game.label.to_json
        end

        it "response should not contain 'season' node with proper value" do
          page.should_not have_content @game.season.to_json
        end

        it "response should not contain 'stadium' node with proper value" do
          page.should_not have_content @game.stadium.to_json
        end

        it "response should not contain 'week' node with proper value" do
          page.should_not have_content @game.week.to_json
        end

        it "response should not contain 'home_team_id' node with proper value" do
          page.should_not have_content @game.home_team_id.to_json
        end

        it "response should not contain 'away_team_id' node with proper value" do
          page.should_not have_content @game.away_team_id.to_json
        end

        it "response should not contain 'played_at' node with proper value" do
          page.should_not have_content @game.played_at.to_json
        end
      end
    end
  end
end