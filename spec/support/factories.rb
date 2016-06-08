FactoryGirl.define do
  factory :user do
    username: "default"
    password: "password"
    admin false
  end
end
