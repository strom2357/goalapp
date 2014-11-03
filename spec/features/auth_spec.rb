require 'spec_helper'
require 'rails_helper'

feature "the signup process" do 
	

  it "has a new user page" do
  	visit new_user_url
  	expect(page).to have_content "New user"
  end

  feature "signing up a user" do

    it "shows username on the homepage after signup" do
    	visit new_user_url
    	fill_in 'username', with: "Strom"
    	fill_in 'password', with: "catlover"
    	click_on "Create User"
    	expect(page).to have_content "Strom"
    end

  end

end

feature "logging in" do 

  it "shows username on the homepage after login" do
  	visit new_session_url
  	fill_in 'username', with: "Strom"
  	fill_in 'password', with: "catlover"
  	click_on "Sign In"
  	expect(page).to have_content "Strom"
  end
end

feature "logging out" do 

  it "begins with logged out state" do
  	visit new_session_url
  	expect(page).to have_content "Sign In"
  	expect(page).not_to have_content "Strom"
  end

  it "doesn't show username on the homepage after logout" do
  	visit new_session_url
  	fill_in 'username', with: "Strom"
  	fill_in 'password', with: "catlover"
  	click_on "Sign In"
  	click_on "Sign Out"
		expect(page).not_to have_content "Strom"
	end
end