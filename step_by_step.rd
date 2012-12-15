My attempt at creating my own website for the College Bowl Pool.

I. Setup
	A.  Create Rails app
	B.  Copied Gemfile from previous app.
	C.  Added Rspec, Guard, and Spork
	D.  Updated test confgig to speed up tests by lowering Brcypt's cost function
	E.  Created Repository on Github and pushed

II.  Static Pages
	A.  Created StaticPages Controller with home,contact, and rules actions
	B.  Updated routes.rb
		1.  root to: 'static_pages#home'
		2. match '/page',  to:'static_page#page'
	C.  Removed public/index
	D   Created Ingegration Test on StaticPages
	E.  Created tests for 3 static pages for containing correct title and h1
		1.  Updated Application layout to use full_title helper
		2.  Created full_title helper method
		3.  Updated StaticPages to provide titles
		4.  Created spec/support/utilities.rb with full_title method for tests

III.  Layout
	A.  Created custom.css.scss and imported bootstrap
	B.  Updated layout to include shim, header, and footer partials
	C.  Created shim partial
	E.  Created header partial
	F.  Created footer partial

IV.  Users Controller
	A.  Created users-controller branch
	B.  Generated Users controller
	C.  Generated integration_test
		1. Tested for Signup Page title/h1
			a.  Created signup route
			b.  Updates users/new
	D.  Updated routes.rb to include users resource
	E.  Updated home page to include signup link
	F.  Tested that links route to correct page

V.  Users Model
	A.  Generate users model
	B.  Migrated table
	C.  User Model Test
		1.  Tested for presence validations for mandatory fields
			a. Created validates methods in User model
		2.  Tested for length restrictions (first_name, last_name)
			a.  Added length validations
		3.  Email Tests
			a.  Tested for correct email format
				i.   Created Valid_Email_regex constant
				ii.  Added format validation
			b.  Tested for duplicate emails(case insensitive)
				i.   Added uniqueness validation
				ii.  Added uniqueness validation on db
				iii. Created db migration to add index
				iv.  Migrated db
				v.   Created before_save callback to downcase email in User model
		4.  Password Tests
			a.  Tested that User object has password_digest index
				i.   Created db migration to add password_digest
				ii.  Migrated db
				iii. Prepared test db
			b.  Test for respond_to(password/password_confirmation
			c.  Added password/password_confirmation to test initialization hash
			D.  Tested for blank password
			E.  Tested for password_confirmation not match password
			F.  Tested for password_confirmation being nil
			G.  Tests For Authentication
				i.   respond_to authenticate
				ii.  valid password
				iii. invalid password
				iv.  password length
			H.  Added password/password_confirmation to  attr_accessible in user model
			I.  added has_secure_password method

VI. Sign Up
	A.  Created profile page(show)
	B.  Created a factory to simulate User model
	D.  Tested User Show page
	E.  Added gravatar on profile page
		1.  Added gravatar_for helper method (app/helpers/users_helper)
	F.  Signup Form
		1.  Tested Signup form for invalid information to not change User count and for valid information to change User count by 1
			a.  Added middle_initial and country to User model
				1.  Tested respond_to for MI and
				2.  Tested for email and email_confirmation not matching
			b.  Updated Signup page with form
				1.  Updated CSS page to format form
			c.  Added create action in Users Controller
		2.  Added error_messages partial to form
		3.  Removed the password presence validation in User model and updated config/locales/en.yml
		
VII.  Sign In/Sign Out
	A.  Generated Sessions controller
	B.  Generated Authentication integration test
	c.  Tested Signin page (title/hl contain Sign In)
		a.  Created sessions resource(new,create,destroy)
	D.  Tested that ivalid signin has Invalid error message
		a.  Updated create action to flash error message and redirect to signin if signin info is missing/invalid
	E.  Tested that valid signin brings user to profile page
		a.  Updated create action to sign in the user and redirect to profile page
		b.  updated application_controller.rb to include SessionsHelper
		c.  added remember token to User model(with index)
			1.  Tested that remember token is not blank.
				i.  Created create_remember_token method in User model
		d.  added sign_in(user) function to sessions_helper.rb
		e. Forced the use of SSL in production(config/evironments/production)
		f. added current_user=(user) to sessions_helper which sests @current_user
		g.  added current_user to sessions_helper which  calls the find_by_remember_token method the first time Current_user is called, but returns @current_user on subsequent invocations
		h.  added signed_in? method to sessions helper to check if a user is signed in
		i.  updated header to check if user is signed in and display proper heading
		j. updated javascript application file to include Bootstrap's JavaScript library
		k.  tested that when a user signs up they are signed in automatically
			1.  added sign_in method to Create action in Users controller
		l.  tested for signing out user
			1.  added destroy action to Sessions controller
	F.  added signin fields to application header

***Updated site and routes to have links for sports and reality***

VIII.  Updating Users
	A.  tested edit user page, edit_user_path(user) for correct h1, title, gravatar change link
		1.  created edit action in Uses controller
		2.  created users/edit view with correct form
	B.  Authorization
		1.  tested non-signed in users are are not brought to edit user page and putting a direct update request(Put action) redirects user to signin path
			a.  added before_filter for edit and update actions in Users controller to access signed_in_user function
			b.  added signed_in_user to sessions helper
			c.  updated user_pages_spec to sign_in user during edit user tests
				i.  added sign_in helper method to spec/support/utilities
		2.  tested that users can only edit their own information
			a.  added before_filter for edit and upddate actions in Users controller to access correct_user function
			b.  added correct_user to sessions helper
		3.  tested that when a non signed-in user signs in they are brought to the page they were on
			a.  added redirect_back_or and store_location functions to sessions helper
				i.  added store_location to signed_in_user function
				ii.  added redirect_back_or to sessions Create action

IX.  Admin User
	A.  tested for admin attribute
		a.  added admin column to Users table

X.  Deleting Users
	A.  tested that users cannot delete users from command line
		1.  added before_filter for Destroy action in Users controller to access admin_user function
			i.  added admin_user to sessions helper

