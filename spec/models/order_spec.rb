require 'rails_helper'

RSpec.describe Order, type: :model do
  it {should belong_to(:user)}
  it {should respond_to(:items)}

  scenario "it can create order items" do
    order = Order.create
    item = Item.create(name: "thing", description: "great", price: "10")
    cart = Cart.new({"#{item.id}" => 1})

    order.create_order_items(cart)

    expect(OrderItem.count).to eq 1
    expect("thing").to eq(order.items.last.name)
  end
end
