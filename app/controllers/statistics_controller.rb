class StatisticsController < ApplicationController
  include Calendar

  def index
    @year = params[:year] ? params[:year].to_i : Time.now.year
    @next_year = @year.to_i + 1
    @prev_year = @year.to_i - 1
    @months = months params
    # @month = params[:month] ? params[:month].to_i : Time.now.month
    @total_spendings_this_month =
      current_user.spendings.
        where("extract(year from created_at) = ?", @year).
        where("extract(month from created_at) = ?", @months[:current][:number]).
        sum(:amount)
    @count_spendings_this_month =
      current_user.spendings.
        where("extract(year from created_at) = ?", @year).
        where("extract(month from created_at) = ?", @months[:current][:number]).
        count
    @categories_chart =
      current_user.categories.
        group(:name).joins(:spendings).
        where("extract(year from spendings.created_at) = ?", @year).
        where("extract(month from spendings.created_at) = ?", @months[:current][:number]).
        sum(:amount)
    @stats = {
      "Total spending's": @total_spendings_this_month.to_s,
              "Total items": @count_spendings_this_month.to_s,
    }
  end
end
