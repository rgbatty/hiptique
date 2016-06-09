require 'rails_helper'

RSpec.feature "user views past orders" do
  scenario "they view their orders" do

    user = create(:user)
    order1 = user.orders.create
    order2 = user.orders.create

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit orders_path

    expect(page).to have_content("Order ##{order1.id}")
    expect(page).to have_content("Order ##{order2.id}")
    expect(page).to have_content("Order ##{order3.id}")
  end
end
