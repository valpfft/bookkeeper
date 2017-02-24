module CategoriesHelper
  def spendings_sum_all_month(category)
    def sum_this_month(category)
      category.spendings.
        where(created_at: Time.now.all_month).
        sum(:amount)
    end
    sum_this_month(category).positive? ? sum_this_month(category).round() : ""
  end
end
