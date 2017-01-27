FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "user_#{n}" }
    sequence(:email) { |n| "user_#{n}@example.com" }
    password "password"

    trait :admin do
      role "admin"
    end
  end
end
