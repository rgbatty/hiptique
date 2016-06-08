require 'rails_helper'

RSpec.feature 'visitor can create a new account' do
  # before(:each) do
  #   new_username = "Erin"
  #   password = "password"
  #
  #   visit root_path
  #   click_link "Create Account"
  #
  #   expect(current_path).to eq new_user_path
  # end

  context "with valid params" do
    scenario "they see the link to create an account" do
      new_username = "Erin"
      password = "password"

      # visit root_path
      # click_link "Create Account"
      visit new_user_path

      expect(current_path).to eq new_user_path

      fill_in "Username", with: new_username
      fill_in "Password", with: password
      click_button "Create Account"

      expect(current_path).to eq user_path(User.last)

      within("#flash_welcome") do
        expect(page).to have_content("Thanks for creating an account!")
      end

      expect(page).to have_content("Welcome, #{new_username}")
      # expect(page).to have_content("Log Out")
    end
  end

  # context "with invalid params" do
  #   pending
  #   scenario "name is not present" do
  #     new_username = "Erin"
  #     password = "password"
  #
  #     visit root_path
  #     click_link "Create Account"
  #
  #     expect(current_path).to eq new_user_path
  #
  #     fill_in "Username", with: username
  #     fill_in "password", with: password
  #     click_button "Create Account"
  #
  #     expect(page).to have_content("Name cannot be blank")
  #     expect(current_path).to eq new_user_path
  #   end
  #
  #   scenario "name is not unique" do
  #     pending
  #     existing_user = User.create(name: "Erin", password: "Password")
  #
  #     new_username = "Erin"
  #     password = "password"
  #
  #     visit root_path
  #     click_link "Create Account"
  #
  #     expect(current_path).to eq new_user_path
  #
  #     fill_in "Username", with: username
  #     fill_in "password", with: password
  #     click_button "Create Account"
  #
  #     expect(page).to have_content("#{new_username} has already been taken")
  #     expect(current_path).to eq new_user_path
  #   end
  #
  #   scenario "password is not present" do
  #     new_username = "Erin"
  #
  #     visit root_path
  #     click_link "Create Account"
  #
  #     expect(current_path).to eq new_user_path
  #
  #     fill_in "Username", with: username
  #     click_button "Create Account"
  #
  #     expect(page).to have_content("Password cannot be blank")
  #     expect(current_path).to eq new_user_path
  #   end
  #
  # end
end
