require 'rails_helper'

RSpec.feature 'Visitor can remove items from their cart' do
  describe UserCartsController do
    scenario 'They visit their cart' do
      image_url = "https://wayofcomputer.files.wordpress.com/2015/08/floppy_disc.jpg"
      item = Item.create(name: "Test", description: "So useful!", price: "5.99", image: image_url)

      visit item_path(item.id)
      click_button "Add to cart"

      within("#item-#{item.name}") do
        click_button "Remove"
      end

      expect(page).to have_content "Total: 0"
    end
  end
end
