# an admin
User.create!(
  email: "admin@example.com",
  password: "password",
  password_confirmation: "password",
  role: 1,
)

# and users
10.times do
  name = Faker::Name.unique.name
  User.create!(
    name: name,
    email: Faker::Internet.email(name),
    password: "password",
    password_confirmation: "password",
  )
end
