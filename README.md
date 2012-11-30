My attempt at creating my own website for the College Bowl Pool.

I. Setup
	A.  Create Rails app
	B.  Copied Gemfile from previous app.
	C.  Added Rspec, Guard, and Spork
	D.  Created Repository on Github and pushed

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
	C.  Created shim partial<br>
	<div>>E.         Created header partial</div>
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



