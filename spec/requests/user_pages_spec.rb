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
					fill_in "First Name", 				with: "Example"
					fill_in "M.I.",						with:  "B."
					fill_in "Last Name",				with: "User"
					fill_in "Street Address",			with: "123 Main St."
					fill_in "Apt/Suite/Floor",			with: "Apt. 1"
					fill_in "City", 					with: "Anytown"
					select "New Jersey", 				from: "State/Province"
					fill_in "Zip/Postal Code", 			with: "12345"
					fill_in "Email Address", 			with: "example_user@bowl.com"
					fill_in "Email Confirmation",		with: "example_user@bowl.com"
					fill_in "Password", 				with: "foobar"
					fill_in "Confirm Password", 		with: "foobar"
				end
				it "should create an Amercian user" do
					expect {click_button(submit) }.to change(User, :count).by(1)
					expect { @user.country.should == 'US' }
				end

				describe "Canadian User" do
					before { select "Ontario", from: "State/Province" }
					it "should create a Canadian user" do
						expect {click_button(submit) }.to change(User, :count).by(1)
						expect { @user.country.should == 'CA' }
					end
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
