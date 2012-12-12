require 'spec_helper'

describe "StaticPages" do

	subject { page }

	shared_examples_for "all static Pages" do
		it { should have_selector('h1', text: heading) }
		it { should have_selector('title', text: full_title(page_title)) }
	end


	describe "Home Page" do
		before { visit root_path }
		let(:heading) { 'Sports & Entertainmnet Pools and Fantasy Leagues' }
		let (:page_title) { '' }

		it_should_behave_like "all static Pages"
		it { should_not have_selector('title', 'Home') }
	end

		
	describe "Football Page" do
		before { visit contact_path }
		let(:heading) { 'Football' }
		let(:page_title) { 'Football'}
	end

	describe "Baseball Page" do
		before { visit rules_path }
		let (:heading) { 'Baseball' }
		let(:page_title) { 'Baseball' }
	end

	describe "Basketball Page" do
		before { visit rules_path }
		let (:heading) { 'Basketball' }
		let(:page_title) { 'Basketball' }
	end	

	describe "Hockey Page" do
		before { visit rules_path }
		let (:page_titleheading) { 'Hockey' }
		let(:page_title) { 'Hockey' }
	end	

	describe "Reality TV Page" do
		before { visit rules_path }
		let (:heading) { 'Reality TV' }
		let(:page_title) { 'Reality TV' }
	end

	describe "Award Shows Page" do
		before { visit rules_path }
		let (:heading) { 'Award Shows' }
		let(:page_title) { 'Award Shows' }
	end
		describe "Trainwrecks Page" do
		before { visit rules_path }
		let (:heading) { 'Trainwrecks' }
		let(:page_title) { 'Trainwrecks' }
	end

	describe "Layout has the correct links" do
		before { visit root_path }

		before do
			 click_link 'Football' 
			it { should have_selector('title', text: full_title('Football')) }
		end

		before do
			click_link 'Baseball'
			it  should have_selector('title', text: full_title('Baseball')) 
		end

		before do
			click_link 'Basketball'
			it  should have_selector('title', text: full_title('Basketball')) 
		end

		before do
			click_link 'Hockey'
			it  should have_selector('title', text: full_title('Hockey')) 
		end
		
		before do
			click_link 'Reality TV'
			it  should have_selector('title', text: full_title('Reality TV')) 
		end

		before do
			click_link 'Award Shows'
			it  should have_selector('title', text: full_title('Award Shows')) 
		end

		before do
			click_link 'Trainwrecks'
			it  should have_selector('title', text: full_title('Trainwrecks')) 
		end		

		before do
			click_link 'Home'
			click_link 'Sign up now!'
			it  should have_selector('title', text: full_title('Sign up')) 
		end
	end
end
		