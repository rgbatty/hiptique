require 'rails_helper'

RSpec.feature 'Visitor can modify the quantity of items in their cart' do
  scenario 'They modify the quantity of an existing cart item' do
    item = create(:item)

    page.set_rack_session(:cart => {item.id => 1})
    visit user_carts_path

    within("#item-#{item.name}") do
     expect(page).to have_field('quantity', with: '1')
    end

    fill_in 'quantity', with: "2"
    click_button 'Update'

    expect(page).to have_current_path(user_carts_path)
    within("#item-#{item.name}") do
     expect(page).to have_field('quantity', with: '2')
    end

    expect(page).to have_content "Total Price: $10"

    fill_in 'quantity', with: "1"
    click_button 'Update'

    expect(page).to have_current_path(user_carts_path)
    within("#item-#{item.name}") do
     expect(page).to have_field('quantity', with: '1')
    end

    expect(page).to have_content "Total Price: $5"
  end
end
