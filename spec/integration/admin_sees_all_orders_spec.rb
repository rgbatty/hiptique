require 'rails_helper'

RSpec.feature "admin views orders" do
  scenario "can see all orders" do
    admin = create(:user, role: 1)
    user = create(:user_with_orders)
    orders = user.orders

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_path

    within("h3") do
      expect(page).to have_content("All Orders")
    end

    within("table") do
        expect(page).to have_content(orders[0].id)
    end
  end
end
