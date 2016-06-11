require 'rails_helper'

RSpec.feature "admin login functions" do
  scenario "admin logs in" do
    admin = create(:user, role: 1)

    visit login_path

    fill_in "Username", with: admin.username
    fill_in "Password", with: admin.password

    click_button "Log In"

    expect(current_path).to eq('/admin/dashboard')

    within("h1") do
      expect(page).to have_content("Welcome, #{admin.username}")
      end
    end
  end
