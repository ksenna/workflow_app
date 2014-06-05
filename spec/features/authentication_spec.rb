require 'spec_helper'
include AuthenticationHelper

feature "authentication" do 
	let(:user) { FactoryGirl.create(:user) }

	scenario "logging in with correct password" do
		login(user)
		current_path.should eq('/wishlists')
	end

	scenario "admin logging in" do
		login(user)
		current_path.should eq('/wishlists')
	end

end