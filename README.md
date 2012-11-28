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

