require "rails_helper"

RSpec.feature "Users can manage categories" do
  scenario "user can add category" do
    user = FactoryGirl.create(:user)
    sign_in(user.email, user.password)

    visit categories_path
    fill_in "Name", with: "new unique category"
    click_button("Add category")
    expect(page).to have_content("new unique category")
  end
  scenario "user cannot create two categories with same names" do
    user = FactoryGirl.create(:user)
    sign_in(user.email, user.password)

    visit categories_path
    fill_in "Name", with: "not unique category"
    click_button("Add category")
    fill_in "Name", with: "not unique category"
    click_button("Add category")
    expect(page).to have_content("Name has already been taken")
  end
end
