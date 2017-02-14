require "rails_helper"

RSpec.feature "Users can manage spendings" do
  scenario "user see link to spendings after log in" do
    user = create(:user)
    sign_in(user.email, user.password)

    visit("/")
    expect(page).to have_link("Spendings", href: spendings_path)
  end

  scenario "user see a list of all spendings" do
    user = create(:user)
    spending = create(:spending)
    sign_in(user.email, user.password)

    visit spendings_path

    expect(page).to have_content(spending.name)
  end

  scenario "user can create a new spendings" do
    user = create(:user)
    spending = build(:spending)
    sign_in(user.email, user.password)

    visit spendings_path
    fill_in "Name", with: spending.name
    fill_in "Amount", with: spending.amount
    select(spending.category.name, from: "Category")
    click_on "Provide spending"
    expect(page).to have_link(spending.name)
  end

  scenario "user can delete spendings" do
    user = create(:user)
    spending = create(:spending)
    sign_in(user.email, user.password)

    visit spending_path(spending)
    click_on "Delete"

    expect(page).to have_content("Deleted #{spending.name}")
  end

  scenario "user can edit spendings" do
    user = create(:user)
    spending = create(:spending)
    sign_in(user.email, user.password)
  end
end
