require 'rails_helper'

RSpec.feature "user can checkout" do
  scenario "visitor checkout process" do
    item = create(:item)
    user = create(:user)

    page.set_rack_session(:cart => {item.id => 1})

    visit cart_path

    click_link "Login or Create Account to Checkout"

    fill_in "Username", with: user.username
    fill_in "Password", with: user.password

    click_button "Log In"

    expect(current_path).to eq(cart_path)

    click_button "Checkout"

    expect(current_path).to eq("/orders")
    expect(Order.size).to eq(1)

    within("#flash_notice") do
      expect(page).to have_content("Order was successfully placed.")
    end

    within("tr") do
      expect(page).to have_content(Order.last.id)
    end
  end
end
