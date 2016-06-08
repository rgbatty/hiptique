require 'rails_helper'

RSpec.feature 'Visitor can add items to their cart' do
  scenario 'They click on the add to cart link from an item page' do
    image_url = "https://wayofcomputer.files.wordpress.com/2015/08/floppy_disc.jpg"
    item = Item.create(name: "Test", description: "So useful!", price: "5.99", image: image_url)

    visit item_path(item.id)
    click_button "Add to cart"
    click_link "Cart"

    within("#item-#{item.name}") do
        expect(page).to have_current_path(user_carts_path)
        expect(page).to have_content item.name
        expect(page).to have_content item.description
        expect(page).to have_content item.price
        expect(page).to have_content "1"
    end

    expect(page).to have_content "Total Price: $#{item.price}"
  end
end
