require 'rails_helper'

RSpec.feature "user can rate an ordered item" do
  scenario "they rate the item" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    order = user.orders.create
    item = order.items.create(name: "thing", price: 10.99, description: "a good thing")

    visit orders_path(order)

    select "5", from: "item[rating]"
    click_button "Rate This Item"

    expect(page).to have_content("5/5")
  end
end

#users see the items they've ordered via order items
#they can rate the order; users give many ratings to items;
#items have one rating per user
#items have many orders 
