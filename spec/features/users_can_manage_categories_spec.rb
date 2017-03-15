require "rails_helper"

RSpec.feature "Users can manage categories" do
  scenario "user can add category" do
    user = create(:user)
    sign_in(user.email, user.password)

    visit "/categories"
    fill_in "category[name]", with: "new unique category"
    click_button("Add category")
    expect(page).to have_button("new unique category")
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
    category = create(:category, user: user)
    sign_in(user.email, user.password)

    visit "/categories"
    click_on category.name
    click_on "Delete category"
    expect(page).to have_content "Deleted #{category.name}"
  end

  scenario "user can rename categories", js: true do
    user = create(:user)
    category = create(:category, user: user)
    sign_in(user.email, user.password)

    visit "/categories"
    click_on category.name
    click_on "Edit category name"
    fill_in "category_name", with: "new_category"
    click_on "Update category"
    expect(page).to have_content("new_category was successfully updated")
  end
end
