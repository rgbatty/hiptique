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

  #manually write a test that asserts 0 things in db if an item is created w/o all validations
end
