require "rails_helper"

RSpec.describe CategoriesItem, type: :model do
  context "relationships" do
    it { should belong_to(:category) }
    it { should respond_to(:category) }
    it { should belong_to(:item) }
    it { should respond_to(:item) }
  end
end
