require 'spec_helper'

describe "UserPages" do

subject { page }

	describe "Sign Up Page" do
		before { visit signup_path }

		it { should have_selector('h1', text: 'Sign up') }
		it  { should have_selector('title', text: full_title('Sign up')) }
		
		describe "Signing Up" do
			let(:submit) { "Create my account" }
			
			describe "with invalid information" do
				it "should not create a user" do
					expect { click_button(submit) }.not_to change(User, :count)
				end
			end

			describe "with valid information" do
				before do
					fill_in "First Name", 			with: "Example"
					fill_in "Middle Initial",		with:  "B."
					fill_in "Last Name",			with: "User"
					fill_in "Address 1",			with: "123 Main St."
					fill_in "Address 2",			with: "Apt. 1"
					fill_in "City", 				with: "Anytown"
					fill_in "Country",				with:  "United States"
					fill_in "State",				with: "NJ"
					fill_in "Zip Code", 			with: "12345"
					fill_in "email", 				with: "example_user@bowl.com"
					fill_in "email",				with: "example_user@bowl.com"
					fill_in "twitter name",			with: "exampleuser23"
				end
				it "should create a user" do
					expect {click_button(submit) }.to change(User, :count).by(1)
				end
			end
		end
	end

	describe "Profile Page" do
		let(:user) { FactoryGirl.create(:user) }
		before { visit user_path(user) }

		it { should have_selector('h1', text: "#{user.first_name} #{user.last_name}") }
		it { should have_selector('title', text: "#{user.first_name} #{user.last_name}") }
	end
end
