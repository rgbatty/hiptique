require 'rails_helper'

RSpec.feature "user can log in" do
  # context "with valid params" do
    scenario "they see the link to log in " do
      user = create(:user)

      visit login_path

      fill_in "Username", with: user.username
      fill_in "password", with: user.password
      clink_button "Log In"

      within("navbar") do
        expect(page).to have_content("Logged in as #{new_username}")
        expect(page).to have_content("Log Out")
        expect(page).not_to have_content("Log Out")
      end

      # within("some html") do
      #   #user sees their page content
      # end
    end

  # end
end
