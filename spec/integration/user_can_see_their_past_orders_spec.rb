require 'rails_helper'

RSpec.feature "user views past orders" do
  scenario "they view their orders" do
    user1 = create(:user)
    order1 = user1.orders.create
    order2 = user1.orders.create

    user2 = create(:user)
    order3 = user2.orders.create
    order4 = user2.orders.create

    visit login_path

    fill_in "Username", with: user1.username
    fill_in "Password", with: user1.password
    click_button "Log In"

    visit orders_path

    expect(page).to have_content("#{order1.id} #{order1.created_at}")
    expect(page).to have_content("#{order2.id} #{order2.created_at}")

    expect(page).not_to have_content("#{order3.id} #{order3.created_at}")
    expect(page).not_to have_content("#{order4.id} #{order4.created_at}")
  end
end
