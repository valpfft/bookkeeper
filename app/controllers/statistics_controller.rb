class StatisticsController < ApplicationController
  def index
    @categories_chart =
      current_user.categories.
        group(:name).joins(:spendings).sum(:amount)
  end
end
