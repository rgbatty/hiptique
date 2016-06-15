require 'rails_helper'

RSpec.feature "Visitor can see all items by category", :type => :feature do
  scenario "visitor visits a category page" do
    category = create(:category)
    items = create_list(:item, 2)
    category.items << items

    visit category_path(category.id)

    expect(page).to have_content(items[0].name)
    expect(page).to have_content(items[0].price)

    expect(page).to have_content(items[1].name)
    expect(page).to have_content(items[1].price)
  end
end
