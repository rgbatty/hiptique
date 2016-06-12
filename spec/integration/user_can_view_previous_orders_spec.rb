require 'rails_helper'

RSpec.feature "viewing past orders" do
  scenario "user can view past orders" do
    items = create_list(:item, 2 )
    user = create(:user)
    order = user.orders.create
    order.items << items

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit orders_path

    click_link order.id

    expect(current_path).to eq(order_path(order))

    expect(page).to have_link(items[0].name)
    expect(page).to have_content(items[0].quantity)
    expect(page).to have_content(items[0].price)
    expect(page).to have_content(items[0].subtotal)

    expect(page).to have_link(items[1].name)
    expect(page).to have_content(items[1].quantity)
    expect(page).to have_content(items[1].price)
    expect(page).to have_content(items[1].subtotal)

    expect(page).to have_content(order.status)

    expect(page).to have_content(order.total)
    expect(page).to have_content(order.created_at)
  end

end

# If the order was completed or cancelled
# Then I should see a timestamp when the action took place
