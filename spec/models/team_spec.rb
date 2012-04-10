require 'spec_helper'

describe Team do

  describe "attributes" do

    it { should respond_to(:name) }
    it { should respond_to(:nickname) }
    it { should respond_to(:abbreviation) }
    it { should respond_to(:city) }
    it { should respond_to(:conference) }
    it { should respond_to(:division) }

    describe "accessibility" do

      before(:each) do
        @attrs = FactoryGirl.attributes_for(:team)
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

      describe "city" do

        it "should be accessible" do
          @team.city.should eq @attrs[:city]
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
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:conference) }
    it { should validate_presence_of(:division) }
  end
end
