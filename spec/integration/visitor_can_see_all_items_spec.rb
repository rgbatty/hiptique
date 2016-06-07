require 'rails_helper'

RSpec.feature "Visitor can see all items", :type => :feature do
  scenario "visitor visits the items page" do
    item1 = Item.create(name: "Polaroid Camera", description: "A great camera", price: "15.99")
    item2 = Item.create(name: "Floppy Disc", description: "So useful!", price: "5.99")

    visit items_path

    within("h1") do
      expect(page).to have_content("All Available Items")
    end

    within("ul") do
      expect(page).to have_content(item1.name)
      expect(page).to have_content(item2.name)
    end
  end
end
