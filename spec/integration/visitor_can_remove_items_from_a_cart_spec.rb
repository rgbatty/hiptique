require 'rails_helper'

RSpec.feature 'Visitor can remove items from their cart' do
  scenario 'They visit their cart' do
    item = create(:item)

    page.set_rack_session(:cart => {item.id => 1})
    visit cart_items_path
    
    within("#item-#{item.name}") do
      click_button "Remove"
    end

    expect(page).to have_current_path(cart_items_path)
    expect(page).to have_content "Total Price: $0"
  end
end
