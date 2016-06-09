FactoryGirl.define do
  factory :user do
    username
    password "password"
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
