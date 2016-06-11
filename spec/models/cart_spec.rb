require 'rails_helper'

RSpec.describe Cart, type: :model do
  it "has initial contents" do
    item = Item.create(name: "Floppy Disc", description: "So great", price: "5.99")
    cart = Cart.new({ item.id.to_s => 1 })

    expect(cart.contents).to eq ({ item.id.to_s => 1 })
  end

  it "can add items" do
    item_1 = Item.create(name: "Floppy Disc", description: "So great", price: "5.99")
    item_2 = Item.create(name: "Floppy Disc", description: "So useful!", price: "5.99")

    cart = Cart.new({ item_1.id.to_s => 1 })

    cart.add_item(item_1.id)
    cart.add_item(item_2.id)

    expect(cart.contents).to eq ({ item_1.id.to_s => 2, item_2.id.to_s => 1})
  end

  it "returns total price of all items" do
    item_1 = Item.create(name: "Floppy Disc", description: "So great", price: "5.99")
    item_2 = Item.create(name: "Floppy Disc", description: "So useful!", price: "5.99")

    cart = Cart.new({ item_1.id.to_s => 3, item_2.id.to_s => 1})

    expect(cart.total).to eq 20
  end

  it "can add items to an empty cart" do
    item = Item.create(name: "Floppy Disc", description: "So great", price: "5.99")
    cart = Cart.new(nil)

    cart.add_item(item.id)
  end

  it "can remove existing items from a cart" do
    item = Item.create(name: "Floppy Disc", description: "So great", price: "5.99")
    cart = Cart.new({ item.id.to_s => 1 })

    cart.remove_item(item.id)

    expect(cart.total).to eq 0
  end

  it "won't attempt to remove items from an empty cart" do
    cart = Cart.new(nil)

    cart.remove_item(2)

    expect(cart.total).to eq 0
  end

  it "can convert its contents to a hash of objects and quantities" do
    item = Item.create(name: "Floppy Disc", description: "So great", price: "5.99")
    cart = Cart.new({ item.id.to_s => 1 })

    result = cart.obj_contents

    expect(result).to eq ({item => 1})
  end

  it "can convert an empty cart to a hash of objects and quantities" do
    cart = Cart.new(nil)

    result = cart.obj_contents

    expect(result).to eq({})
  end

  it "can update the quantity of the cart" do
    item = Item.create(name: "Floppy Disc", description: "So great", price: "5.99")
    cart = Cart.new({ item.id.to_s => 1 })

    cart.update_quantity(item.id, 2)

    expect(cart.contents["#{item.id}"]).to eq(2)
    cart.update_quantity(item.id, 1)
    expect(cart.contents["#{item.id}"]).to eq(1)
  end

end
