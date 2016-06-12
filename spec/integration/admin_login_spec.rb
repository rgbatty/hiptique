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
      expect(page).to have_content("Admin Dashboard")
    end
    within("h2") do
      expect(page).to have_content("Welcome, #{admin.username}")
      end
    end

    context "default users can't view admin dashboard" do
      scenario "default user cannot view admin dashboard" do
        user = create(:user)

        ApplicationController.any_instance.stubs(:current_user).returns(user)

        visit admin_dashboard_path

        expect(page).not_to have_content("Admin Dashboard")

        within("title") do
          expect(page).to have_content("The page you were looking for doesn't exist")
      end
    end

      scenario "guest cannot view admin dashboard" do
        visit admin_dashboard_path

        expect(current_path).to eq login_path
      end
  end
end
