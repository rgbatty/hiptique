require "rails_helper"

RSpec.feature "Unauthenticated User has correct privledges" do
  scenario "cannot view another user's data" do
    user = create(:user)

    visit dashboard_path

    expect(current_path).to eq(login_path)
    expect{visit ("/users/#{user.id}") }.to raise_error( ActionController::RoutingError)
  end

  scenario "cannot view admin dashboard" do
    visit admin_dashboard_path

    expect(current_path).to eq(login_path)
  end

  scenario "cannot manually create admin user role", type: :request do
    post "/users", user: { username: "test", password: "test",
                           password_confirmation: "test",
                           email: "test@test.com",
                           email_confirmation: "test@test.com",
                           name: "John Doe",
                           address: "1234 Fake Street", city: "Faketown",
                           state: "FT", zip: "12345", role: 1 }

    expect(response).to redirect_to(dashboard_path)
    follow_redirect!

    expect(response).to render_template(:show)
    expect(response.body).to include("Welcome, John Doe")
  end
end
