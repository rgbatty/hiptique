require 'rails_helper'

RSpec.feature "visitor becomes users and can see cart checkout" do
  context "visitor has to register account to checkout" do
    scenario 'visitor sees register account links' do
      item = create(:item)

      visit item_path(item.id)

      click_button "Add to cart"
      click_link "Cart"

      within("#user_buttons") do
        expect(page).to have_link("Login or Create Account to Checkout")
      end
    end
  end

  context "visitor registers" do
    scenario "when visitor register and visits cart, checkout is available" do
      item = create(:item)

      visit item_path(item.id)
      click_button "Add to cart"
      click_link "Cart"

      click_link "Login or Create Account to Checkout"

      fill_in "Username", with: "Ilana"
      fill_in "Password", with: "password"
      fill_in "Confirm Password", with: "password"

      click_button "Create Account"

      click_link "Cart"

      within("#user_buttons") do
        expect(page).to have_button("Checkout")
      end
    end
  end
end
