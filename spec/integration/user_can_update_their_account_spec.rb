require 'rails_helper'

RSpec.feature "User can update account" do
  scenario "user wants to update information" do
    user = create(:user)
    new_user_name = "Bob"

    visit login_path

    fill_in "Username", with: user.username
    fill_in "Password", with: user.password

    click_button "Log In"
    click_link "Update Account Information"

    #expect(current_path).to eq(edit_user_path(user))

    #save_and_open_page

    fill_in "Username", with: new_user_name
    fill_in "Password", with: user.password
    fill_in "Confirm Password", with: user.password

    click_button "Update Information"

    #expect(current_path).to eq(user_path(user))

    within("h1") do
      expect(page).to have_content(new_user_name)
      expect(page).not_to have_content(user.username)
    end
  end
end
