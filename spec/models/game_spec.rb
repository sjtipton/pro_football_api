require 'spec_helper'

describe Game do

  before(:each) do
    @attrs = FactoryGirl.attributes_for(:game)
  end

  describe "attributes" do

    it { should respond_to(:label) }
    it { should respond_to(:season) }
    it { should respond_to(:stadium) }
    it { should respond_to(:week) }
    it { should respond_to(:home_team_id) }
    it { should respond_to(:away_team_id) }
    it { should respond_to(:played_at) }

    describe "accessibility" do

      before(:each) do
        @game = Game.create(@attrs)
      end

      describe "label" do

        it "should be accessible" do
          @game.label.should eq @attrs[:label]
        end
      end

      describe "season" do

        it "should be accessible" do
          @game.season.should eq @attrs[:season]
        end
      end

      describe "stadium" do

        it "should be accessible" do
          @game.stadium.should eq @attrs[:stadium]
        end
      end

      describe "week" do

        it "should be accessible" do
          @game.week.should eq @attrs[:week]
        end
      end

      describe "home_team_id" do

        it "should be accessible" do
          @game.home_team_id.should eq @attrs[:home_team_id]
        end
      end

      describe "away_team_id" do

        it "should be accessible" do
          @game.away_team_id.should eq @attrs[:away_team_id]
        end
      end

      describe "played_at" do

        it "should be accessible" do
          @game.played_at.should eq @attrs[:played_at]
        end
      end
    end
  end

  describe "validations" do

    subject { FactoryGirl.create(:game) }

    it { should validate_presence_of(:label) }
    it { should validate_presence_of(:season) }
    it { should validate_presence_of(:stadium) }
    it { should validate_presence_of(:home_team_id) }
    it { should validate_presence_of(:away_team_id) }
  end
end
