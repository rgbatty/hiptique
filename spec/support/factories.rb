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
  end

  sequence :username do |n|
    "User #{n}"
  end

  sequence :name do |n|
    "item_#{n}"
  end
end
