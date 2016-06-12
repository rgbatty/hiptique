require 'rails_helper'

RSpec.describe Item, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:price) }
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

end
