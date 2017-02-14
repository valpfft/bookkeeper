FactoryGirl.define do
  factory :spending do
    category
    user
    sequence(:name) { |n| "spending_#{n}" }
    amount { rand(2..22) }
  end
end
