require "rails_helper"

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
      click_link "Create Account"

      fill_in "Username", with: "jdoe"
      fill_in "Password", with: "password"
      fill_in "Email", with: "test@test.com"
      fill_in "Full Name", with: "John Doe"
      fill_in "Address", with: "1234 Fake Street"
      fill_in "City", with: "Faketown"
      fill_in "State", with: "FT"
      fill_in "Zip", with: "12345"

      fill_in "Confirm Email", with: "test@test.com"
      fill_in "Confirm Password", with: "password"
      click_button "Create Account"

      click_link "Cart"

      within("#user_buttons") do
        expect(page).to have_button("Checkout")
      end
    end
  end
end
