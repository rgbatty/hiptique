require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:orders) }

  it { should respond_to(:orders) }
  it { should respond_to(:username) }
  it { should respond_to(:password) }

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:state) }
  it { should validate_presence_of(:zip) }

  it { should validate_uniqueness_of(:username) }

  it { should validate_confirmation_of(:password).with_message("does not match") }
  it { should validate_confirmation_of(:email).with_message("does not match") }

  scenario "user is not valid with bad attributes" do
    user = User.new(username: "admin", password: "admin")
    user_1 = User.new(username: "admin", password: "admin", email: "icorson@example.com")
    user_2 = User.new(username: "admin", password: "admin", email: "icorson@example.com", name: "ilana")
    user_3 = User.new(username: "admin", password: "admin", email: "icorson@example.com", name: "ilana", address: "8902 Lincoln Street")
    user_4 = User.new(username: "admin", password: "admin", email: "icorson@example.com", name: "ilana", address: "8902 Lincoln Street", city: "denver")
    user_5 = User.new(username: "admin", password: "admin", email: "icorson@example.com", name: "ilana", address: "8902 Lincoln Street", city: "denver", state: "CO")

    expect(user.save).to eq false
    expect(user_1.save).to eq false
    expect(user_2.save).to eq false
    expect(user_3.save).to eq false
    expect(user_4.save).to eq false
    expect(user_5.save).to eq false
  end
end
