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

  it "returns total number of all items" do
    item_1 = Item.create(name: "Floppy Disc", description: "So great", price: "5.99")
    item_2 = Item.create(name: "Floppy Disc", description: "So useful!", price: "5.99")

    cart = Cart.new({ item_1.id.to_s => 3, item_2.id.to_s => 1})

    expect(cart.total).to eq 4
  end

  it "can add items to an empty cart" do
    item = Item.create(name: "Floppy Disc", description: "So great", price: "5.99")
    cart = Cart.new(nil)

    cart.add_item(item.id)
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
end
