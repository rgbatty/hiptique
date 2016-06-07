require 'rails_helper'

RSpec.feature "Visitor can see all items by category", :type => :feature do
  scenario "visitor visits a category page" do
    category = Category.create(name: "Data Storage")
    item1 = category.items.create(name: "Floppy Disc", description: "So great", price: "5.99")
    item2 = category.items.create(name: "CD", description: "Pretty great too", price: "2.99")

    visit category_path(category)

    within("Some html here") do
      assert page.has_content(item1.name)
      assert page.has_content(item1.description)
      assert page.has_content(item1.price)
    end

    within("more html here") do
      assert page.has_content(item2.name)
      assert page.has_content(item2.description)
      assert page.has_content(item2.price)
    end
  end
end
