FactoryGirl.define do
  factory :user do
    username
    password "password"
  end

  factory :item do
    name
    description "test description"
    price "5.99"
    image "http://i.imgur.com/kgOqHMk.gif"
  end

  factory :category do
    name
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
end
