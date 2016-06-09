require 'rails_helper'

RSpec.feature 'Visitor can remove items from their cart' do
  describe UserCartsController do
    scenario 'They visit their cart' do
      item = create(:item)

      page.set_rack_session(:cart => {item.id => 1})
      visit user_carts_path
      within("#item-#{item.name}") do
        click_button "Remove"
      end

      expect(page).to have_current_path(user_carts_path)
      expect(page).to have_content "Total Price: $0"
    end
  end
end
