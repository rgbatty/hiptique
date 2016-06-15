require "rails_helper"

RSpec.feature "admin can change order status" do
  scenario "they changed the status, duh" do
    items = create_list(:item, 2)
    admin = create(:user, role: 1)
    user = create(:user)
    order = user.orders.create
    cart = Cart.new({ items[0].id => 1, items[1].id => 1 })
    order.create_order_items(cart)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit order_path(order)

    within("#status") do
      expect(page).to have_content("Status: ordered")
      expect(page).to have_button("Update Status")
    end
    select "paid", from: "order[status]"
    click_button "Update Status"

    within("#status") do
      expect(page).to have_content("Status: paid")
      expect(page).to have_button("Update Status")
    end

    select "cancelled", from: "order[status]"
    click_button "Update Status"

    within("#status") do
      expect(page).to have_content("Status: cancelled")
      expect(page).not_to have_content("Update Status")
    end
  end
end
