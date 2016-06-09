require 'rails_helper'

RSpec.feature "Visitor can see all items", :type => :feature do
  scenario "visitor visits the items page" do
    items = create_list(:item, 2)

    visit items_path

    within("h1") do
      expect(page).to have_content("All Available Items")
    end

    within(".all_info") do
      expect(page).to have_content(items[0].name)
      expect(page).to have_content(items[1].name)
    end
  end
end
