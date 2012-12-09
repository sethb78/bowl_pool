require 'spec_helper'

describe "Authentication" do

subject { page }
before { visit signin_path }
let(:user) { FactoryGirl.create(:user) }

	describe "Signin Page" do

		it { should have_selector('title', text: 'Sign In') }
		it { should have_selector('h1', text: 'Sign In') }
		
		describe "with invalid information" do
      		before { click_button "Sign in" }
      		it { should have_selector('title', text: 'Sign In') }
      		it { should have_selector('div.alert.alert-error', text: 'Invalid') }
    	end

    	describe "after visiting another page" do
        	before { click_link "Game Home" }
        	it { should_not have_selector('div.alert.alert-error') }
      	end

    	describe "With Valid Information" do
			before do
				fill_in "Email", 		with: user.email 
				fill_in "Password",		with: user.password
				click_button "Sign in"
			end

			it { should have_selector('title', text:  "#{user.first_name} #{user.last_name}") }
			it { should have_link('Profile', href: user_path(user)) }
			it { should have_link('Sign out', href: signout_path) }
			it { should_not have_link('Sign in', href: signin_path) }
		end
	end
end
