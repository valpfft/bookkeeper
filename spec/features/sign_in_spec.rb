require "rails_helper"

feature "Sign in", :devise do
  scenario "user cannot sign in with invalid credentials" do
    sign_in("example@example.com", "password")

    expect(page).to have_content("Invalid Email or password")
  end

  scenario "user can sign with valid credentials" do
    user = FactoryGirl.create(:user)
    sign_in(user.email, user.password)

    expect(page).to have_content("Signed in successfully.")
  end

  scenario "user cannot sign in with invalid email" do
    user = FactoryGirl.create(:user)
    sign_in("invalid@email.com", user.password)

    expect(page).to have_content("Invalid Email or password")
  end

  scenario "user cannot sign in with invalid password" do
    user = FactoryGirl.create(:user)
    sign_in(user.email, "invalid_password")

    expect(page).to have_content("Invalid Email or password")
  end
end
