require 'rails_helper'

RSpec.feature 'Visitor can add items to their cart' do
  scenario 'They click on the add to cart link from an item page' do
    item = create(:item)

    visit item_path(item.id)
    click_button "Add to cart"
    click_link "Cart"
    # save_and_open_page


    within("#item-#{item.name}") do
      expect(page).to have_current_path(user_carts_path)
      expect(page).to have_content item.name
      expect(page).to have_content item.description
      expect(page).to have_content item.price
      expect(page).to have_field('quantity', with: '1')
    end

    expect(page).to have_content "Total Price: $#{item.price}"
  end
end
