require 'spec_helper'

describe "UserPages" do

subject { page }
let(:user) { FactoryGirl.create(:user) }


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
					fill_in "First Name*", 				with: "Example"
					fill_in "M.I.",						with:  "B."
					fill_in "Last Name*",				with: "User"
					fill_in "Street Address*",			with: "123 Main St."
					fill_in "Apt/Suite/Floor",			with: "Apt. 1"
					fill_in "City*", 					with: "Anytown"
					select "New Jersey", 				from: "State/Province*"
					fill_in "Zip/Postal Code*", 		with: "12345"
					fill_in "Email Address*", 			with: "example_user@bowl.com"
					fill_in "Email Confirmation*",		with: "example_user@bowl.com"
					fill_in "Password*", 				with: "foobar"
					fill_in "Confirm Password*", 		with: "foobar"
				end
				it "should create an Amercian user" do
					expect {click_button(submit) }.to change(User, :count).by(1)
					expect { @user.country.should == 'US' }
				end

				describe "Canadian User" do
					before { select "Ontario", from: "State/Province" }
					it "should create a Canadian user" do
						expect { click_button(submit) }.to change(User, :count).by(1)
						expect { @user.country.should == 'CA' }
					end
				end

				describe "After Saving The User" do
					before { click_button(submit) }
					it { should have_link('Sign Out') }

					describe "Then Signing Out" do
						before { click_link("Sign Out") }
	    				it { should have_button('Sign In') }
      				end
				end
	   		end
		end
	end

	describe "Profile Page" do
		before { visit user_path(user) }

		it { should have_selector('h1', text: "#{user.first_name} #{user.last_name}") }
		it { should have_selector('title', text: "#{user.first_name} #{user.last_name}") }
	end

	describe "Edit User" do
		before do
			sign_in(user)
			visit edit_user_path(user)
		end

		describe "page" do
	      	it { should have_selector('h1',    text: "Update your profile") }
	      	it { should have_selector('title', text: "Edit User") }
	      	it { should have_link('change', href: 'http://gravatar.com/emails') }
	    end

	    describe "with invalid information" do
	    	before { click_button "Save Changes" }
	    	it { should have_content('error') }
	    end

	    describe "with valid information" do
	    	let(:new_first_name) { "New" }
	    	let(:new_email) { "abc@aol.com" }
	    	let(:new_email_confirmation) { "abc@aol.com"}
	    	before do
	    		fill_in "First Name*", 				with: new_first_name
				select "New Jersey", 				from: "State/Province*"
				fill_in "Email Address*", 			with: new_email
				fill_in "Email Confirmation*",		with: new_email_confirmation
				fill_in "Password*", 				with: user.password
				fill_in "Confirm Password*", 		with: user.password_confirmation
			    click_button "Save Changes"
			end
			it { should have_selector('title', text: new_first_name) }
      		it { should have_selector('div.alert.alert-success') }
      		it { should have_link('Sign Out', href: signout_path) }
      		specify { user.reload.first_name.should  == new_first_name }
      		specify { user.reload.email.should == new_email } 
		end
	end
end
