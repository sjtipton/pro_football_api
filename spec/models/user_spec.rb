require 'spec_helper'

describe User do

  before(:each) do
    @attrs = FactoryGirl.attributes_for(:user)
  end

  describe "attributes" do

    it { should respond_to(:email) }
    it { should respond_to(:password) }
    it { should respond_to(:password_confirmation) }
    it { should respond_to(:authentication_token) }

    describe "accessibility" do

      before(:each) do
        @user = User.create(@attrs)
      end

      describe "email" do

        it "should be accessible" do
          @user.email.should eq @attrs[:email]
        end
      end

      describe "password" do

        it "should be accessible" do
          @user.password.should eq @attrs[:password]
        end
      end

      describe "password_confirmation" do

        it "should be accessible" do
          @user.password_confirmation.should eq @attrs[:password_confirmation]
        end
      end

      describe "authentication_token" do

        it { should_not allow_mass_assignment_of(:authentication_token) }
      end
    end
  end

  describe "validations" do

    subject { FactoryGirl.create(:user) }

    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should_not allow_value("a@!d.com").for(:email) }
    it { should allow_value("example@example.com").for(:email) }

    describe "authentication_token" do

      before(:each) do
        @user = User.create(@attrs)
      end

      it "should be present" do
        @user.authentication_token = nil
        @user.save
        @user.authentication_token.should_not be_nil
      end

      it "should not be blank after the creation of user" do
        @user.authentication_token.should_not be_blank
      end
    end

    describe "password_confirmation" do

      it "should be present" do
        @user = User.create(@attrs.merge(password_confirmation: ""))
        @user.should_not be_valid
      end
    end

    context "with duplicate email" do

      it "should not be valid" do
        assert_raise(ActiveRecord::RecordNotUnique) { 2.times { User.create!(@attrs) }}
      end
    end

    context "with non-matching password" do

      it "should not be valid" do
        User.create(@attrs.merge(password: "aaaa"))
      end
    end

    context "with non-matching password_confirmation" do

      it "should not be valid" do
        User.create(@attrs.merge(password_confirmation: "aaaa"))
      end
    end
  end
end
