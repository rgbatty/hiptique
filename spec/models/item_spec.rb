require 'rails_helper'

RSpec.describe Item, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:price) }
  end

  context "relationships" do
    it { should have_many(:categories_items) }
    it { should have_many(:categories) }
    it { should have_many(:order_items) }
  end

  scenario "active and retired statuses" do
    item = create(:item)
    expect(item.active?).to eq true
    expect(item.retired?).to eq false

    retired_item = create(:item, status: 1)
    expect(retired_item.retired?).to eq true
    expect(retired_item.active?).to eq false
  end

  scenario "no item is created in db without passing validations" do
    item = Item.new(name: "thingy")
    expect(item.save).to eq false
    expect(Item.count).to eq(0)

    item = Item.new(name: "thingy", description: "it's great")
    expect(item.save).to eq false
    expect(Item.count).to eq(0)

    item = Item.new(name: "thingy", price: "12")
    expect(item.save).to eq false
    expect(Item.count).to eq(0)


    item = Item.new(description: "it's great", price: "12")
    expect(item.save).to eq false
    expect(Item.count).to eq(0)
  end

  it "gives the quantity and subtotal of an item per order" do
    items = create_list(:item, 2)
    user = create(:user)
    order = user.orders.create
    cart = Cart.new({ items[0].id => 1, items[1].id => 1 })
    order.create_order_items(cart)

    expect(items[0].quantity(order.id)).to eq "1"
    expect(items[0].subtotal(order.id)).to eq 5.99
  end

end
