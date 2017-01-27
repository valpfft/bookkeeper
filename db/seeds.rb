# an admin
User.create!(
  email: "admin@example.com",
  password: "password",
  password_confirmation: "password",
)

# and users
10.times do
  User.create!(
    email: Faker::Internet.unique.email,
    password: "password",
    password_confirmation: "password",
  )
end
