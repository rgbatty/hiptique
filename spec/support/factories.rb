FactoryGirl.define do
  factory :user do
    username
    password "password"
  end

  sequence :username do |n|
    "User #{n}"
  end
end
