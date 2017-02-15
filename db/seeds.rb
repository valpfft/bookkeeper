# an admin
User.create!(
  email: "admin@example.com",
  name: "Johny The Ripper",
  password: "password",
  password_confirmation: "password",
  role: 1,
)

# and users
100.times do
  name = Faker::Name.unique.name
  User.create!(
    name: name,
    email: Faker::Internet.email(name),
    password: "password",
    password_confirmation: "password",
  )
end

# Fake spendings
user = User.first
Category.create!(
  name: "Faker",
  user: user,
)

100.times do
  Spending.create!(
    name: Faker::Commerce.product_name,
    amount: Faker::Commerce.price,
    category_id: Category.first.id,
    user: user,
  )


end
