require 'rails_helper'
#
RSpec.feature "visitor becomes users and can see cart checkout" do
  context "visitor has to register account to checkout" do
    scenario 'visitor sees register account links' do
      image_url = "https://wayofcomputer.files.wordpress.com/2015/08/floppy_disc.jpg"
      item = Item.create(name: "Test", description: "So useful!", price: "5.99", image: image_url)

      visit item_path(item.id)
      click_button "Add to cart"
      click_link "Cart"

      within("#user_buttons") do
          expect(page).to have_link("Register Account")
      end
    end
  end

  context "visitor registers" do
     scenario "when visitor register and visits cart, checkout is available" do
      image_url = "https://wayofcomputer.files.wordpress.com/2015/08/floppy_disc.jpg"
      item = Item.create(name: "Test", description: "So useful!", price: "5.99", image: image_url)

      visit item_path(item.id)
      click_button "Add to cart"
      click_link "Cart"

      click_link "Register Account"

      fill_in "Username", with: "Ilana"
      fill_in "Password", with: "password"

      click_button "Create Account"

      click_link "Cart"

      within("#user_buttons") do
        expect(page).to have_button("Checkout")
      end
    end
  end
end
