FactoryGirl.define do
	factory :user do
		first_name 				"Seth"
		last_name 				"Altshuler"
		email					"sethb78@gmail.com"
		twitter					"sethbaltshuler"
		address1				"37 Appletree Dr."
		city					"Matawan"
		state 					"NJ"
		zip 					"07747"
		password				"foobar"
		password_confirmation	"foobar"
	end
end

