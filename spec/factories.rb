FactoryGirl.define do
	factory :user do
		sequence(:first_name)			{ |n| "First #{n}" }
		middle_initial					"B"
		sequence(:last_name)			{ |n| "Last #{n}" }
		sequence(:email)				{ |n| "person_#{n}@example.com"}
		sequence(:email_confirmation)	{ |n| "person_#{n}@example.com"}
		twitter							"sethbaltshuler"
		address1						"37 Appletree Dr."
		city							"Matawan"
		state 							"New Jersey"
		zip 							"07747"
		password						"foobar"
		password_confirmation			"foobar"
		factory :admin do
      		admin true
    	end
	end

	factory :wronguser, class: User do
		first_name 				"Al"
		middle_initial			"B"
		last_name 				"Bundy"
		email					"abc@gmail.com"
		email_confirmation		"abc@gmail.com"
		twitter					"sethbaltshuler"
		address1				"37 Appletree Dr."
		city					"Matawan"
		state 					"New Jersey"
		zip 					"07747"
		password				"foobar"
		password_confirmation	"foobar"
	end 

	factory :playoffpoolgame do
		week					"1"
		date					"2nd Jan 2013 13:05:00"
		home					"NY Jets"
		away					"NY Giants"
		spread					3.5
	end
end

