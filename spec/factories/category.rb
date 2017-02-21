FactoryGirl.define do
  factory :category do
    user
    sequence(:name) { |n| "category_#{n}" }
  end
end
