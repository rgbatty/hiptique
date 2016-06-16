require 'rails_helper'

RSpec.describe Order, type: :model do
  context "relationships" do
    it { should belong_to(:user) }
    it { should respond_to(:user) }
    it { should have_many(:order_items) }
    it { should respond_to(:order_items) }
    it { should have_many(:items) }
    it { should respond_to(:items) }
  end

  scenario "order statuses map to status number in db" do
    order = create(:order)
    expect(order.ordered?).to eq true
    expect(order.paid?).to eq false
    expect(order.cancelled?).to eq false
    expect(order.completed?).to eq false

    paid_order = create(:order, status: 1)
    expect(paid_order.paid?).to eq true
    expect(paid_order.ordered?).to eq false
    expect(paid_order.cancelled?).to eq false
    expect(paid_order.completed?).to eq false

    cancelled_order = create(:order, status: 2)
    expect(cancelled_order.cancelled?).to eq true
    expect(cancelled_order.ordered?).to eq false
    expect(cancelled_order.paid?).to eq false
    expect(cancelled_order.completed?).to eq false

    completed_order = create(:order, status: 3)
    expect(completed_order.completed?).to eq true
    expect(completed_order.ordered?).to eq false
    expect(completed_order.cancelled?).to eq false
    expect(completed_order.paid?).to eq false
  end

  scenario "it can create order items" do
    order = Order.create
    item = Item.create(name: "thing", description: "great", price: "10")
    cart = Cart.new({ "#{item.id}" => 1 })

    order.create_order_items(cart)

    expect(OrderItem.count).to eq 1
    expect("thing").to eq(order.items.last.name)
  end

  scenario "it updates its status to cancelled" do
    order = create(:order)
    expect(order.status).to eq("ordered")
    order.cancel
    expect(order.status).to eq("cancelled")
  end

  scenario "it updates its status to complete" do
    order = create(:order)
    expect(order.status).to eq("ordered")
    order.complete
    expect(order.status).to eq("completed")
  end

  scenario "it gives the total price" do
    items = create_list(:item, 2)
    user = create(:user)
    order = user.orders.create
    cart = Cart.new({ items[0].id => 1, items[1].id => 1 })
    order.create_order_items(cart)

    expect(order.total_price).to eq(11.98)
  end

  scenario "it gives the relevant time for a given status" do
    ordered_order = create(:order)
    paid_order = create(:order, status: 1)
    cancelled_order = create(:order, status: 2)
    completed_order = create(:order, status: 3)

    expect(ordered_order.get_relevant_time).to eq ordered_order.updated_at
    expect(paid_order.get_relevant_time).to eq paid_order.updated_at
    expect(cancelled_order.get_relevant_time).to eq cancelled_order.finished_at
    expect(completed_order.get_relevant_time).to eq completed_order.finished_at
  end

  scenario "it counts all with a given status" do
    create_list(:order, 3)
    create(:order, status: 1)
    create(:order, status: 2)
    create(:order, status: 3)

    expect(Order.total(0)).to eq 3
    expect(Order.total(1)).to eq 1
    expect(Order.total(2)).to eq 1
    expect(Order.total(3)).to eq 1
  end

  scenario "it returns all order objects with a given status" do
    create_list(:order, 3)
    create(:order, status: 1)
    create(:order, status: 2)
    create(:order, status: 3)

    expect(Order.objects(0).count).to eq 3
    expect(Order.objects(1).count).to eq 1
    expect(Order.objects(2).count).to eq 1
    expect(Order.objects(3).count).to eq 1
  end

  scenario "it tells whether status is editable" do
    default_order = create(:order)
    paid_order = create(:order, status: 1)
    cancelled_order = create(:order, status: 2)
    completed_order = create(:order, status: 3)

    expect(default_order.editable_status?).to eq true
    expect(paid_order.editable_status?).to eq true
    expect(cancelled_order.editable_status?).to eq false
    expect(completed_order.editable_status?).to eq false
  end

  scenario "it give status options based on current status" do
    default_order = create(:order)
    paid_order = create(:order, status: 1)

    expect(default_order.status_options).to eq(["ordered", "paid", "cancelled"])
    expect(paid_order.status_options).to eq(["paid", "completed", "cancelled"])
  end
end
