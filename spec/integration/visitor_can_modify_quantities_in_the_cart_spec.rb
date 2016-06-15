require "rails_helper"

RSpec.feature "Visitor can modify the quantity of items in their cart" do
  scenario "They modify the quantity of an existing cart item" do
    item = create(:item)

    page.set_rack_session(:cart => {item.id => 1})
    visit cart_path

    expect(page).to have_select("quantity", selected: "1")

    select "2", from: "quantity"
    click_button 'Update'

    expect(page).to have_current_path(cart_path)

    expect(page).to have_select("quantity", selected: "2")
    expect(page).to have_content "Total Price: $11.98"

    select "1", from: "quantity"
    click_button 'Update'

    expect(page).to have_current_path(cart_path)

    expect(page).to have_select("quantity", selected: "1")
    expect(page).to have_content "Total Price: $5.99"
  end
end
