require 'rails_helper'

RSpec.feature "user views past orders" do
  scenario "they view thier orders" do
#     Background: An existing user that has multiple orders
# As an Authenticated User
# When I visit "/orders"
# Then I should see all orders belonging to me and no other or
  user = create(:user)
  allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  order1 = user.create(:order)
  order2 = user.create(:order)

  visit user_orders_path

  expect(page).to have_content(order1.items)
  expect(page).to have_content(order2.items)
  end
end
