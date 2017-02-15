require "rails_helper"

RSpec.feature "Users can manage categories" do
  scenario "user can add category" do
    user = create(:user)
    sign_in(user.email, user.password)

    visit "/categories"
    fill_in "category[name]", with: "new unique category"
    click_button("Add category")
    expect(page).to have_link("new unique category")
  end

  scenario "user cannot create two categories with same names" do
    user = create(:user)
    sign_in(user.email, user.password)

    visit categories_path
    fill_in "category[name]", with: "not unique category"
    click_button("Add category")
    fill_in "category[name]", with: "not unique category"
    click_button("Add category")
    expect(page).to have_content("Name has already been taken")
  end

  scenario "user can delete categories", js: true do
    user = create(:user)
    category = create(:category)
    sign_in(user.email, user.password)

    visit category_path(category)
    page.accept_confirm do
      click_on "Delete!"
    end

    expect(page).to have_content "Deleted #{category.name}"
  end

  scenario "user can list all spending's in category" do
    user = create(:user)
    spending = create(:spending, user: user)
    sign_in(user.email, user.password)

    visit category_path(spending.category)

    expect(page).to have_content spending.category.name
  end
end
