require 'spec_helper'

describe "Team Games feature", type: :request do

  before(:each) do
    @teams = []
    2.times { @teams << FactoryGirl.create(:team) }
    @game = FactoryGirl.create(:game, home_team_id: @teams.first.id,
                                      away_team_id: @teams.second.id)
  end

  context "when authenticated" do

    before(:each) do
      @user = FactoryGirl.create(:user)
      @user.confirm!
    end

    describe "showing an index of Team Games" do

      context "when visiting the team_games_path route" do

        before(:each) do
          visit team_games_path(id: @teams.first.id, auth_token: @user.authentication_token)
        end

        it "response should not contain 'game' node" do
          page.should_not have_content "game"
        end

        it "response should contain 'id' node with proper value" do
          page.should have_content @game.id.to_json
        end

        it "response should contain 'label' node with proper value" do
          page.should have_content @game.label.to_json
        end

        it "response should contain 'season' node with proper value" do
          page.should have_content @game.season.to_json
        end

        it "response should contain 'stadium' node with proper value" do
          page.should have_content @game.stadium.to_json
        end

        it "response should contain 'week' node with proper value" do
          page.should have_content @game.week.to_json
        end

        it "response should contain 'home_team_id' node with proper value" do
          page.should have_content @game.home_team_id.to_json
        end

        it "response should contain 'away_team_id' node with proper value" do
          page.should have_content @game.away_team_id.to_json
        end

        it "response should contain 'played_at' node with proper value" do
          page.should have_content @game.played_at.to_json
        end
      end

      context "when visiting the team_schedule_path route" do

        before(:each) do
          visit team_schedule_path(id: @teams.first.id, auth_token: @user.authentication_token)
        end

        it "response should not contain 'game' node" do
          page.should_not have_content "game"
        end

        it "response should contain 'id' node with proper value" do
          page.should have_content @game.id.to_json
        end

        it "response should contain 'label' node with proper value" do
          page.should have_content @game.label.to_json
        end

        it "response should contain 'season' node with proper value" do
          page.should have_content @game.season.to_json
        end

        it "response should contain 'stadium' node with proper value" do
          page.should have_content @game.stadium.to_json
        end

        it "response should contain 'week' node with proper value" do
          page.should have_content @game.week.to_json
        end

        it "response should contain 'home_team_id' node with proper value" do
          page.should have_content @game.home_team_id.to_json
        end

        it "response should contain 'away_team_id' node with proper value" do
          page.should have_content @game.away_team_id.to_json
        end

        it "response should contain 'played_at' node with proper value" do
          page.should have_content @game.played_at.to_json
        end
      end
    end
  end
end