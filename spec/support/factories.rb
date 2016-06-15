FactoryGirl.define do
  factory :user do
    username
    password "password"
    password_confirmation "password"
    email "email@test.com"
    name "John Doe"
    address "1234 Fake Street"
    city  "Faketown"
    state "FT"
    zip "1234"
    role "default"

    factory :user_with_orders do
      orders { create_list(:order, 3) }
    end
  end

  factory :item do
    name
    description "test description"
    price "5.99"
    image "http://i.imgur.com/kgOqHMk.gif"
    status 0
  end

  factory :category do
    name
  end

  factory :order do
    user
    status 0

    factory "order_with_items" do
      items { create_list(:item, 3) }
    end 
  end

  sequence :username do |n|
    "User #{n}"
  end

  sequence :name do |n|
    "item_#{n}"
  end
end
