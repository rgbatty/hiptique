require "rails_helper"

RSpec.feature "Visitor can see all items", :type => :feature do
  scenario "visitor visits the items page" do
    items = create_list(:item, 2)

    visit items_path

    expect(page).to have_content(items[0].name)
    expect(page).to have_content(items[1].name)
  end
end
