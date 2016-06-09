require 'rails_helper'

RSpec.feature 'Visitor can modify the quantity of items in their cart' do
  scenario 'They modify the quantity of an existing cart item' do
    image_url = "https://wayofcomputer.files.wordpress.com/2015/08/floppy_disc.jpg"
    item = Item.create(name: "Test", description: "So useful!", price: "5.99", image: image_url)

    page.set_rack_session(:cart => {item.id => 1})
    visit user_carts_path

    save_and_open_page

    within("#item-#{item.name}") do
     expect(page).to have_content("1")
    end

    fill_in 'quantity', with: "2"
    click_button 'Update'

    expect(page).to have_current_path(user_carts_path)
    within("#item-#{item.name}") do
     expect(page).to have_content("2")
    end

    expect(page).to have_content "Total Price: $10"

    fill_in 'quantity', with: "1"
    click_button 'Update'

    expect(page).to have_current_path(user_carts_path)
    within("#item-#{item.name}") do
     expect(page).to have_content("1")
    end

    expect(page).to have_content "Total Price: $5"
  end
end
