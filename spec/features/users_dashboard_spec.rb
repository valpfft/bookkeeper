require "rails_helper"

RSpec.feature "Users sees overview on root_page" do
  let(:user) { FactoryGirl.create(:user) }
  let(:category) { FactoryGirl.create(:category, user: user) }
  let(:spending1) do
    FactoryGirl.create(
      :spending,
      user: user, category: category,
    )
  end
  let(:spending2) do
    FactoryGirl.create(
      :spending,
      user: user, category: category,
    )
  end
  let(:spending3) do
    FactoryGirl.create(
      :spending,
      user: user, category: category,
    )
  end

  scenario "today spending's" do
    spending1.update(created_at: Date.today)
    spending2.update(created_at: Date.today + 2.days)
    sign_in(user.email, user.password)

    within "#today_feature" do
      expect(page).to have_link(spending1.amount)
      expect(page).to_not have_link(spending1.amount + spending2.amount)
    end
  end

  scenario "today spending's modal", js: true do
    spending1.update(created_at: Date.today + 2.days)
    spending2.update(created_at: Date.today)
    sign_in(user.email, user.password)

    within "#today_feature" do
      click_on spending2.amount
    end

    within "#dailySpendingsModal" do
      expect(page).to have_content(spending2.amount)
      expect(page).to have_content(spending2.name)
      expect(page).to have_content(spending2.category_name)
      expect(page).to have_content(spending2.created_at.strftime("%A, %b %-d"))
    end
  end

  scenario "user sees weekly spending's" do
    spending1.update(created_at: Date.today.beginning_of_week)
    spending2.update(created_at: Date.today.end_of_week)
    spending3.update(created_at: Date.today.end_of_week + 3.days)
    sign_in(user.email, user.password)

    within "#weekly_feature" do
      expect(page).to have_link(spending1.amount + spending2.amount)
      expect(page).to_not have_link(spending1.amount +
                                    spending2.amount +
                                    spending3.amount)
    end
  end

  scenario "weekly spending's modal", js: true do
    spending1.update(created_at: Date.today.beginning_of_week)
    spending2.update(created_at: Date.today.end_of_week)
    spending3.update(created_at: Date.today.end_of_week + 3.days)
    sign_in(user.email, user.password)

    within "#weekly_feature" do
      click_on spending1.amount + spending2.amount
    end

    within "#weeklySpendingsModal" do
      expect(page).to have_content(spending1.amount)
      expect(page).to have_content(spending1.name)
      expect(page).to have_content(spending1.category_name)
      expect(page).to have_content(spending1.created_at.strftime("%A, %b %-d"))

      expect(page).to have_content(spending2.amount)
      expect(page).to have_content(spending2.name)
      expect(page).to have_content(spending2.category_name)
      expect(page).to have_content(spending2.created_at.strftime("%A, %b %-d"))

      expect(page).to have_content(spending1.amount + spending2.amount)
    end
  end

  scenario "user sees monthly spendings" do
    spending1.update(created_at: Date.today.end_of_month)
    spending2.update(created_at: Date.today.beginning_of_month)
    spending3.update(created_at: Date.today.beginning_of_month - 2.days)
    sign_in(user.email, user.password)

    within "#monthly_feature" do
      expect(page).to have_link(spending2.amount + spending1.amount)
      expect(page).to_not have_link(spending1.amount +
                                    spending2.amount +
                                    spending3.amount)
    end
  end

  scenario "monthly spending's modal", js: true do
    spending1.update(created_at: Date.today.end_of_month)
    spending2.update(created_at: Date.today.beginning_of_month)
    spending3.update(created_at: Date.today.beginning_of_month - 2.days)
    sign_in(user.email, user.password)

    within "#monthly_feature" do
      click_on spending1.amount + spending2.amount
    end

    within "#monthlySpendingsModal" do
      expect(page).to have_content(spending1.amount)
      expect(page).to have_content(spending1.name)
      expect(page).to have_content(spending1.category_name)
      expect(page).to have_content(spending1.created_at.strftime("%A, %b %-d"))

      expect(page).to have_content(spending2.amount)
      expect(page).to have_content(spending2.name)
      expect(page).to have_content(spending2.category_name)
      expect(page).to have_content(spending2.created_at.strftime("%A, %b %-d"))

      expect(page).to have_content(spending1.amount + spending2.amount)
    end
  end
end
