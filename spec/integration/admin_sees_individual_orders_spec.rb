require "rails_helper"

RSpec.feature "admin sees orders" do
  scenario "admin can see an individual orders" do
    items = create_list(:item, 2)
    admin = create(:user, role: 1)
    user = create(:user)
    order = user.orders.create
    cart = Cart.new({ items[0].id => 1, items[1].id => 1 })
    order.create_order_items(cart)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit order_path(order)

    within("#site_content") do
      expect(page).to have_content("Placed at: #{order.created_at}" )
    end

    within("#status") do
      expect(page).to have_content("Status: ordered")
    end

    within("#items") do
      expect(page).to have_link(items[0].name)
      expect(page).to have_content(items[0].quantity(order.id))
      expect(page).to have_content(items[0].price)
      expect(page).to have_content(items[0].subtotal(order.id))

      expect(page).to have_link(items[1].name)
      expect(page).to have_content(items[1].quantity(order.id))
      expect(page).to have_content(items[1].price)
      expect(page).to have_content(items[1].subtotal(order.id))
    end

    within("#total") do
      expect(page).to have_content(order.total_price)
    end
  end
end
