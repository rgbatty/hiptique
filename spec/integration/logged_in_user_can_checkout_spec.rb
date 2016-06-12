require 'rails_helper'

RSpec.feature 'logged in user can check out' do
  scenario 'they check out' do
    item = create(:item)
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit item_path(item)
    click_button("Add to cart")

    visit cart_path

    click_button "Checkout"

    expect(current_path).to eq("/orders")
    expect(Order.size).to eq(1)

    within("#flash_notice") do
      expect(page).to have_content("Order was successfully placed.")
    end

    within("tr") do
      expect(page).to have_content(Order.last.id)
    end

  end

end
