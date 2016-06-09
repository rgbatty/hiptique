require 'rails_helper'

RSpec.feature 'visitor can create a new account' do
  context "with valid params" do
    scenario "they see the form to create an account" do
      new_username = "Erin"
      password = "password"

      visit login_path
      click_link "Create Account"

      fill_in "Username", with: new_username
      fill_in "Password", with: password
      click_button "Create Account"

      expect(current_path).to eq '/dashboard'

      within("#flash_welcome") do
        expect(page).to have_content("Thanks for creating an account!")
      end

      within(".navbar") do
        expect(page).to have_content("Logged in as #{new_username}")
        expect(page).to have_content("Log Out")
        expect(page).not_to have_content("Log In")
      end
    end
  end

  context "with invalid params" do
    scenario "name is not present" do
      password = "password"

      visit new_user_path

      fill_in "Password", with: password
      click_button "Create Account"

      expect(page).to have_content("Username can't be blank")
      expect(page).to have_button("Create Account")
      expect(page).not_to have_content("Thanks for creating an account!")
    end

    scenario "name is not unique" do
      User.create(username: "Erin", password: "Password")

      new_username = "Erin"
      password = "password"

      visit new_user_path

      fill_in "Username", with: new_username
      fill_in "Password", with: password
      click_button "Create Account"

      within('#flash_error') do
        expect(page).to have_content("Username has already been taken")
      end
    end

    scenario "password is not present" do
      new_username = "Erin"

      visit new_user_path

      fill_in "Username", with: new_username
      click_button "Create Account"

      within('#flash_error') do
        expect(page).to have_content("Password can't be blank")
      end
    end
  end
end
