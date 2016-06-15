require 'rails_helper'

RSpec.feature 'Visitor can remove items from their cart' do
  scenario 'They visit their cart' do
    item = create(:item)

    page.set_rack_session(:cart => {item.id => 1})
    visit cart_path
    
    within("#cart-table-#{item.name}") do
      click_button "Remove"
    end

    expect(page).to have_current_path(cart_path)
    expect(page).to have_content "Total Price: $0"
  end
end
