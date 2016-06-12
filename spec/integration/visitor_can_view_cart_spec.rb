require 'rails_helper'

RSpec.feature 'Visitor can view their cart' do
  scenario 'They visit their cart from the home page' do
    visit root_path

    click_link "Cart"

    expect(page).to have_current_path(cart_path)

    expect(page).to have_content("Cart")
  end
end
