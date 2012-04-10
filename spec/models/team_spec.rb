require 'spec_helper'

describe Team do

  describe "attributes" do

    it { should respond_to(:name) }
    it { should respond_to(:nickname) }
    it { should respond_to(:city) }
    it { should respond_to(:abbreviation) }
    it { should respond_to(:conference) }
    it { should respond_to(:division) }
  end

  describe "validations" do

    subject { FactoryGirl.create(:team) }

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:nickname) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:abbreviation) }
    it { should validate_presence_of(:conference) }
    it { should validate_presence_of(:division) }
  end
end
