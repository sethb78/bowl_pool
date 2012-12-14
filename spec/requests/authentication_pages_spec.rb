require 'spec_helper'

describe "Authentication" do

subject { page }
let(:user) { FactoryGirl.create(:user) }

	describe "Signin Page" do
		before { visit signin_path }

		it { should have_selector('title', text: 'Sign In') }
		it { should have_selector('h1', text: 'Sign In') }
		
		describe "with invalid information" do
      		before { click_button "Sign In" }
      		it { should have_selector('title', text: 'Sign In') }
      		it { should have_selector('div.alert.alert-error', text: 'Invalid') }
    	end

    	describe "after visiting another page" do
        	before { click_link "Home" }
        	it { should_not have_selector('div.alert.alert-error') }
      	end

    	describe "With Valid Information" do
			before do
				sign_in(user)
			end

			it { should have_selector('title', text:  "#{user.first_name} #{user.last_name}") }
			it { should have_link('Profile', href: user_path(user)) }
			it { should have_link('Settings', href: edit_user_path(user)) }
			it { should have_link('Sign Out', href: signout_path) }
			it { should_not have_link('Sign In', href: signin_path) }
		end
	end

	describe "authorization" do

	    describe "for non-signed-in users" do

	      	describe "in the Users controller" do

		        describe "visiting the edit page" do
		          	before { visit edit_user_path(user) }
		          	it { should have_selector('title', text: 'Sign In') }
		        end

		        describe "submitting to the update action" do
		          before { put user_path(user) }
		          specify { response.should redirect_to(signin_path) }
		        end
	      	end
	    end

	    describe "as the wrong user" do
	    	let(:wrong_user) { FactoryGirl.create(:wronguser) }
	    	before {sign_in(user) }
	    	
	    	describe "visiting Users edit page" do
	    		before	{ visit edit_user_path(wrong_user) }
	    		it { should_not have_selector('title', text: full_title('Edit User')) }
	    	end

	    	describe "submitting a PUT request to the Users update action" do
	    		before { put user_path(wrong_user) }
	    		specify { response.should redirect_to(root_path) }
	    	end
	    end

	    describe "After signing in user bringing them back to intended page" do

      		describe "when attempting to visit a protected page" do
        		before { visit edit_user_path(user) }

        		describe " then signing in" do
        			 before { sign_in(user) }
                	
                	describe "after signing in" do

                		it "should render the desired protected page" do
            				page.should have_selector('title', text: 'Edit User')
          				end
        			end

      			end
			end
			      		describe "when attempting to visit a protected page" do
        		before { visit edit_user_path(user) }

        		describe " then signing in" do
        			 before { sign_in(user) }
                	
                	describe "after signing in" do

                		it "should render the desired protected page" do
            				page.should have_selector('title', text: 'Edit User')
          				end
        			end

      			end
			end
		end
	end
end

