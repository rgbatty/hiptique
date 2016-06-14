require 'rails_helper'

RSpec.feature "admin views orders" do
  scenario "can see all orders" do
    admin = create(:user, role: 1)
    user = create(:user_with_orders)
    orders = user.orders

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_path

    within("#all") do
      expect(page).to have_content("All Orders")
    end

    within("#all_orders") do
      expect(page).to have_link(orders[0].id)
      expect(page).to have_link(orders[1].id)
      expect(page).to have_link(orders[2].id)
      expect(page).to have_content(orders[0].status)
      expect(page).to have_content(orders[1].status)
      expect(page).to have_content(orders[2].status)
    end

    within("#ordered") do
      expect(page).to have_content(orders.count)
    end

    within("#paid") do
      expect(page).to have_content(orders.count)
    end

    within("#cancelled") do
      expect(page).to have_content(orders.count)
    end

    within("#completed") do
      expect(page).to have_content(orders.count)
    end
  end
end
