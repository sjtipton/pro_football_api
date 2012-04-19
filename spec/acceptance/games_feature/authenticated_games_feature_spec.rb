require 'spec_helper'

describe "Games feature", type: :request do

  before(:each) do
    @game = FactoryGirl.create(:game)
  end

  context "when authenticated" do

    before(:each) do
      @user = FactoryGirl.create(:user)
      @user.confirm!
    end

    describe "showing an index of Games" do

      context "when visiting the games_path route" do

        before(:each) do
          visit games_path(auth_token: @user.authentication_token)
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

      context "when visiting the complete_schedule_path route" do

        before(:each) do
          visit complete_schedule_path(auth_token: @user.authentication_token)
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

    describe "showing a Game" do

      before(:each) do
        get game_path(id: @game.id, auth_token: @user.authentication_token)
        @body = JSON.parse(response.body)
      end

      it "response should not contain 'game' node" do
        @body.should_not include "game"
      end

      it "response should contain 'id' node with proper value" do
        @body["id"].should eq @game.id
      end

      it "response should contain 'label' node with proper value" do
        @body["label"].should eq @game.label
      end

      it "response should contain 'season' node with proper value" do
        @body["season"].should eq @game.season
      end

      it "response should contain 'stadium' node with proper value" do
        @body["stadium"].should eq @game.stadium
      end

      it "response should contain 'week' node with proper value" do
        @body["week"].should eq @game.week
      end

      it "response should contain 'home_team_id' node with proper value" do
        @body["home_team_id"].should eq @game.home_team_id
      end

      it "response should contain 'away_team_id' node with proper value" do
        @body["away_team_id"].should eq @game.away_team_id
      end

      it "response should contain 'played_at' node with proper value" do
        @body["played_at"].should eq @game.played_at
      end
    end
  end
end