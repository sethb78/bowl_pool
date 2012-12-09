require 'spec_helper'
	
describe User do

	before { @user  =  User.new(first_name: "Example", middle_initial: "B.",last_name: "User",email: "user@example.com", email_confirmation: "user@example.com", twitter: "twitter_example", address1: "abc 1st St", address2: "apt. 1", city: "Matawan", state: "nj", zip: "12345", password: "foobar", password_confirmation: "foobar") }

	subject { @user }
	it { should respond_to(:first_name) }
	it { should respond_to(:last_name) }
	it { should respond_to(:email) }
	it { should respond_to(:twitter) }
	it { should respond_to(:address1) }
	it { should respond_to(:address2) }
	it { should respond_to(:city) }
	it { should respond_to(:state) }
	it { should respond_to(:zip) }
	it { should respond_to(:password_digest) }
	it { should respond_to(:password) }
	it { should respond_to(:password_confirmation) }
	it { should respond_to(:remember_token) }
	it { should respond_to(:authenticate) }
	it { should respond_to(:middle_initial) }
	it { should respond_to(:country) }
	it { should respond_to(:email_confirmation) }
	it { should be_valid }

	describe "Name Validations" do
		describe "when name is not present" do
			describe "missing first name" do
				before { @user.first_name  =  " " }
				it { should_not be_valid }
			end
			describe "missing last name" do
				before { @user.last_name = " " }
				it { should_not be_valid }
			end
		end

		describe "when name is too long" do
			describe "first name length" do
				before { @user.first_name = "a"*26 }
				it { should_not be_valid }
			end
			describe "last name length" do
				before { @user.last_name  = "a" *26 }
				it { should_not be_valid }
			end
		end
	end

	describe "Email Validations" do
		describe "when email is not present" do
			before { @user.email  = " " }
			it { should_not be_valid }
		end

		describe "Invalid Emails" do
			it "should be invalid" do
		      	addresses  =  %w[user@foo,com user_at_foo.org example.user@foo.
		                     foo@bar_baz.com foo@bar+baz.com]
		      	addresses.each do |invalid_address|
		        	@user.email  =  invalid_address
		        	@user.should_not be_valid
		      	end      
	    	end

	    	describe "Email is already taken" do
	    		before do
	    			dup_user_email = @user.dup
	    			dup_user_email.email = @user.email.upcase
	    			dup_user_email.email_confirmation = @user.email_confirmation.upcase
	    			dup_user_email.save
	    		end
	    		it { should_not be_valid }
	    	end

	    	describe "Email and Confirmation mismatch" do
	    		before { @user.email_confirmation = "mismatch@abc.com" }
	    		it { should_not be_valid }
	    	end
	    end

	    describe "Valid Emails" do
	    	it "should be valid" do
	    		addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
	    		addresses.each do |valid_address|
	    			@user.email = @user.email_confirmation = valid_address
	    			@user.should be_valid
	    		end
	    	end
	    end
	end

	describe "Password Validations" do
		describe "missing password" do
			before { @user.password = @user.password_confirmation = " " }
			it { should_not be_valid }
		end

		describe "password_confirmation does not match password" do
			before { @user.password_confirmation = "mismatch" }
			it { should_not be_valid }
		end

		describe "when password confirmation is nil" do
    		before { @user.password_confirmation = nil }
    		it { should_not be_valid }
  		end

  		describe "return value of authenticate method" do
  			before { @user.save }
  			let(:found_user) { User.find_by_email(@user.email) }

  			describe "with valid password" do
    			it { should == found_user.authenticate(@user.password) }
  			end

  			describe "with invalid password" do
    			let(:user_for_invalid_password) { found_user.authenticate("invalid") }
    			it { should_not == user_for_invalid_password }
    			specify { user_for_invalid_password.should be_false }
  			end
		end

		describe "password is too short" do
			before { @user.password = @user.password_confirmation = "a" * 5 }
			it { should_not be_valid }
		end
	end

	describe "when address is not present" do
		describe "missing street address" do
			before { @user.address1 = " " }
			it { should_not be_valid }
		end
		describe "missing city" do
			before { @user.city = " " }
			it { should_not be_valid }
		end
		describe "missing state" do
			before { @user.state = " " }
			it { should_not be_valid }
		end
		describe "missing zip code" do
			before { @user.zip = " " }
			it { should_not be_valid }
		end
	end

	describe "remember token" do
	    before { @user.save }
	    its(:remember_token) { should_not be_blank }
  end
end
