FactoryGirl.define do
  factory :user do
    sequence(:email){|n| "email#{n}@example.com"}
    password Faker::Internet.password
  end
end
