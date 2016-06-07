require 'rails_helper'

RSpec.feature "item management", :type => :feature do
  # context "item creation" do
  #   scenario "visitor can create new item" do
  #
  #   visit_new_item_path
  #
  #   fill_in "Name", with: "Gameboy"
  #   fill_in "Description", with: "Bringing it back hard"
  #   fill_in "Price", with: 90
  #
  #   click_button "Create Item"
  #   #root to item show page
  #
  #   within(".item_info") do
  #     expect(page).to have_content("Gameboy")
  #     end
  #   end
  # end

  context "all items" do
    scenario "visitor can see all items" do
      # visit_new_item_path
      #
      # fill_in "Name", with: "Gameboy"
      # fill_in "Description", with: "Bringing it back hard"
      # fill_in "Price", with: 90
      #
      # click_button "Create Item"

      visit items_path

      within(".all_info") do
        expect(page).to have_content("All Available Items")
      end
    end
  end
  #
  # context "items in categories" do
  #   scenario "visitor can see all items in a category" do
  #
  #   @category = Category.find(1)
  #
  #   visit category_item_path(@category)
  #
  #   within(".category_item_info") do
  #     expect(page).to have_content("All Items in #{@category}")
  #     end
  #   end
  # end
end
