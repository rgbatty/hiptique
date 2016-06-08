require 'rails_helper'

RSpec.describe User, type: :model do
  it {should respond_to(:username)}
  it {should respond_to(:password)}

  it {should validate_presence_of(:username)}
  it {should validate_uniqueness_of(:username)}
end
