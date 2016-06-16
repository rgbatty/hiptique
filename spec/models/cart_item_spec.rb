require "rails_helper"

RSpec.describe Cart, type: :model do
  it "can give quantity and subtotal for an item" do
    item = create(:item)
    quantity = 3
    subtotal = 30
    cart_item = CartItem.new(item, quantity, subtotal)

    expect(cart_item.quantity).to eq 3
    expect(cart_item.subtotal).to eq 30
  end
end
