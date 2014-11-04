require 'spec_helper'
require 'rails_helper'

feature "goal setting process" do 
  before :each do
      visit new_user_url
      fill_in 'username', with: "Strom"
      fill_in 'password', with: "catlover"
      click_on "Create User"
      click_on "Create Goal"
      fill_in "Title", with: "Finish project"
      fill_in "Body", with: "Finish today's project by six"
      fill_in "Deadline", with: "6pm 11/3/2014"
      click_on "Save Goal"
  end

  it "creates a goal" do
     #from signed in goals index, 
    #click new goal button
    #fill in goal form... 
    #title? body? completion date?
    #navigate back to index and 
    # expect(page).to have_content goal_name
    expect(page).to have_content "Finish project"
  end

  it "updates a goal" do
    #from goals index, clicks "edit goal",
    #changes name, and clicks save
    #expect(page).to have_content new_goal_name
    click_on "Finish project"
    click_on "Edit goal"
    fill_in "Title", with: "Finish most of project"
    fill_in "Body", with: "Finish today's project by six"
    fill_in "Deadline", with: "6pm 11/3/2014"
    click_on "Update Goal"
    #will go back to index where goal will be a link to show page
    
    expect(page).to have_content "Finish most of project"
  end

  it "deletes a goal" do
    #from goals index, click "delete goal"
    #expect(page).not_to have_content goal_name
    click_on "Finish project"
    click_on "Delete goal"

    expect(page).not_to have_content "Finish most of project"
  end

end