require 'spec_helper'

describe "Games feature", type: :request do

  before(:each) do
    @game = FactoryGirl.create(:game)
  end

  context "when not authenticated" do

    describe "showing an index of Games" do

      context "when visiting the games_path route" do

        before(:each) do
          visit games_path
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

      context "when visiting the complete_schedule_path route" do

        before(:each) do
          visit complete_schedule_path
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

    describe "showing a Game" do

      before(:each) do
        get game_path(@game.id)
        @body = JSON.parse(response.body)
      end

      it "response should not contain 'game' node" do
        @body.should_not include "game"
      end

      it "response should contain 'error' node with error message" do
        @body["error"].should eq ("You need to sign in or sign up before continuing.")
      end

      it "response should not contain 'id' node with proper value" do
        @body["id"].should be_nil
      end

      it "response should not contain 'label' node with proper value" do
        @body["label"].should be_nil
      end

      it "response should not contain 'season' node with proper value" do
        @body["season"].should be_nil
      end

      it "response should not contain 'stadium' node with proper value" do
        @body["stadium"].should be_nil
      end

      it "response should not contain 'week' node with proper value" do
        @body["week"].should be_nil
      end

      it "response should not contain 'home_team_id' node with proper value" do
        @body["home_team_id"].should be_nil
      end

      it "response should not contain 'away_team_id' node with proper value" do
        @body["away_team_id"].should be_nil
      end

      it "response should not contain 'played_at' node with proper value" do
        @body["played_at"].should be_nil
      end
    end
  end
end