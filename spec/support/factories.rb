FactoryGirl.define do
  factory :user do
    username
    password "password"

    factory :user_with_orders do
      orders { create_list(:order, 3) }
    end
  end

  sequence :username do |n|
    "User #{n}"
  end

  sequence :name do |n|
    "item #{n}"
  end

  factory :item do
    name
    description "A great thing"
    price "10"
  end

  factory :order do
    user
  end


end
