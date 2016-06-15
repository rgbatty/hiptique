require "rails_helper"

RSpec.feature "visitor can create a new account" do
  context "with valid params" do
    scenario "they see the form to create an account" do
      new_username = "jdoe"
      password = "password"
      email = "test@test.com"
      full_name = "John Doe"
      address = "1234 Fake Street"
      city = "Faketown"
      state = "FT"
      zip = "12345"
      sender = "do-not-reply@hiptique.herokuapp.com"

      visit login_path
      click_link "Create Account"

      fill_in "Username", with: new_username
      fill_in "Password", with: password
      fill_in "Email", with: email
      fill_in "Full Name", with: full_name
      fill_in "Address", with: address
      fill_in "City", with: city
      fill_in "State", with: state
      fill_in "Zip", with: zip

      fill_in "Confirm Email", with: email
      fill_in "Confirm Password", with: password
      click_button "Create Account"

      expect(current_path).to eq '/dashboard'

      within("#flash_welcome") do
        expect(page).to have_content("Thanks for creating an account!")
      end

      within("#main-navbar") do
        expect(page).to have_content("Logged in as #{new_username}")
        expect(page).to have_content("Log Out")
        expect(page).not_to have_content("Log In")
      end

      mail = ActionMailer::Base.deliveries.last
      expect(mail.to).to eq [email]
      expect(mail.from).to eq [sender]
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
      User.create(username: "Erin", password: "password", password_confirmation: "password")

      new_username = "Erin"
      password = "password"

      visit new_user_path

      fill_in "Username", with: new_username
      fill_in "Password", with: password
      fill_in "Confirm Password", with: password
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

    scenario "password does not match confirmation" do
      new_username = "Erin"
      password = "password"

      visit new_user_path

      fill_in "Username", with: new_username
      fill_in "Password", with: password
      fill_in "Confirm Password", with: "passw0rd"
      click_button "Create Account"

      within("#flash_error") do
        expect(page).to have_content("Password confirmation does not match")
      end
    end
  end
end
