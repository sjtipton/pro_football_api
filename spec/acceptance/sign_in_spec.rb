require 'acceptance/acceptance_helper'
require 'support/devise.rb'

feature "Sign In" do

  before(:each) do
    @user = FactoryGirl.create(:user)
    @user.confirm!
  end

  context "when not authenticated" do

    describe "an attempt to visit a protected resource" do

      it "should display 'You need to sign in or sign up before continuing.' message in json" do
        @login_error = { error: "You need to sign in or sign up before continuing." }
        visit teams_path
        page.should have_content(@login_error.to_json)
      end
    end

    describe "an attempt to visit the home page" do

      before(:each) do
        visit root_path
      end

      it "should display a welcome page" do
        current_path.should eq root_path
        page.should have_content("Sign in")
      end

      context "when User clicks 'Sign in'" do

        before(:each) do
          click_link "Sign in"
        end

        it "should display a sign in form" do
          page.should have_selector("form#user_new")
        end

        it "should display a 'Forgot your password' link" do
          page.should have_link("Forgot your password")
        end

        it "should display a 'Didn't receive confirmation instructions?' link" do
          page.should have_link("Didn't receive confirmation instructions?")
        end

        context "when User signs in" do

          before(:each) do
            fill_in "user_email", with: @user.email
            fill_in "user_password", with: @user.password

            click_button "Sign in"
          end

          it "should send User back to the home page" do
            current_path.should eq root_path
          end

          it "should display 'Signed in as [email].'" do
            page.should have_content("Signed in as #{@user.email}.")
          end

          it "should display 'Not you? [sign out link]'" do
            page.should have_content("Not you?")
            page.should have_link("Sign out")
          end
        end
      end
    end
  end
end