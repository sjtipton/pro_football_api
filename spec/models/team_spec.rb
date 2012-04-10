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
end
