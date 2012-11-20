require 'spec_helper'

describe "StaticPages" do

	subject { page }

	shared_examples_for "all static pages" do
		it { should have_selector('h1', text: heading) }
		it { should have_selector('title', text: full_title(page_title)) }
	end


	describe "Home Page" do
		before { visit root_path }
		let(:heading) { 'Seth B.\'s 9th Annual Bowl Extravaganza' }
		let (:page_title) { '' }

		it_should_behave_like "all static pages"
		it { should_not have_selector('title', 'Home') }
	end

		
	describe "Contact page" do
		before { visit contact_path }
		let(:heading) { 'Contact' }
		let(:page_title) { 'Contact'}
	end

	describe "Rules page" do
		before { visit rules_path }
		let (:heading) { 'Rules' }
		let(:page_title) { 'Rules' }
	end
end
		