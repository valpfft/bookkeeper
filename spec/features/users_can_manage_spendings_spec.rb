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
    spending = create(:spending, user: user)
    sign_in(user.email, user.password)

    visit "/spendings"

    expect(page).to have_content(spending.name)
  end

  scenario "user can create a new spendings" do
    user = create(:user)
    category = create(:category, user: user)
    sign_in(user.email, user.password)

    visit spendings_path
    fill_in "spending[name]", with: "Spending name"
    fill_in "spending[amount]", with: 14.444
    select(category.id, from: "spending[category_id]")
    click_on "Provide spending"
    expect(page).to have_link("Spending name")
    expect(page).to have_link(category.name)
  end

  scenario "user can delete spending" do
    user = create(:user)
    spending = create(:spending, user: user)
    sign_in(user.email, user.password)

    visit spending_path(spending)
    click_on "Delete"

    expect(page).to have_content("Deleted #{spending.name}")
  end

  scenario "user can edit spendings", js: true do
    user = create(:user)
    spending = create(:spending, user: user, name: "Spending Name")
    sign_in(user.email, user.password)

    visit edit_spending_path(spending)
    expect(page).to have_content("Edit spending")
    # save_screenshot("/tmp/shot.png")
    within "form" do
      fill_in "spending[name]", with: "New Spending Name"
    end
    click_on "Update spending"

    expect(page).to have_content("New Spending Name")
  end
end
