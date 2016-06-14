# require 'rails_helper'
#
# RSpec.feature "admin sees orders" do
#   scenario "admin can see an individual orders" do
#
#     admin = create(:user, role: 1)
#     order = create(:order)
#
#     allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
#
#     visit admin_order_page(order)
#
#     within(".purchaser li:first") do
#       expect(page).to
#
#     end
#
#   scenario "checkout takes user to a name and address page" do
#
#     user = create(:user)
#
#     allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
#
#     visit cart_path
#
#     click_button "Checkout"
#
#     expect(current_path).to eq()
#
#   end
