require 'spec_helper'

describe Team do

  before(:each) do
    @attrs = FactoryGirl.attributes_for(:team)
  end

  describe "attributes" do

    it { should respond_to(:name) }
    it { should respond_to(:nickname) }
    it { should respond_to(:abbreviation) }
    it { should respond_to(:location) }
    it { should respond_to(:conference) }
    it { should respond_to(:division) }

    describe "accessibility" do

      before(:each) do
        @team = Team.create(@attrs)
      end

      describe "name" do

        it "should be accessible" do
          @team.name.should eq @attrs[:name]
        end
      end

      describe "nickname" do

        it "should be accessible" do
          @team.nickname.should eq @attrs[:nickname]
        end
      end

      describe "abbreviation" do

        it "should be accessible" do
          @team.abbreviation.should eq @attrs[:abbreviation]
        end
      end

      describe "location" do

        it "should be accessible" do
          @team.location.should eq @attrs[:location]
        end
      end

      describe "conference" do

        it "should be accessible" do
          @team.conference.should eq @attrs[:conference]
        end
      end

      describe "division" do

        it "should be accessible" do
          @team.division.should eq @attrs[:division]
        end
      end
    end
  end

  describe "validations" do

    subject { FactoryGirl.create(:team) }

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:nickname) }
    it { should validate_presence_of(:abbreviation) }
    it { should validate_presence_of(:location) }
    it { should validate_presence_of(:conference) }
    it { should validate_presence_of(:division) }

    context "with duplicate name" do

      it "should not be valid" do
        Team.create!(@attrs)
        Team.new(@attrs).should_not be_valid
      end
    end
  end
end
