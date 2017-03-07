class VisitorsController < ApplicationController
  include Calendar
  before_action :authenticate_user!

  def index
    @year = params[:year] ? params[:year].to_i : Time.now.year
    @next_year = @year.to_i + 1
    @prev_year = @year.to_i - 1
    @months = months params
    @spendings_this_month =
      current_user.spendings.
        where("extract(year from created_at) = ?", @year).
        where("extract(month from created_at) = ?", @months[:current][:number]).
        group(:created_at)
    @daily_spendings = current_user.spendings.where(created_at: Date.today)
    @weekly_spendings =
      current_user.spendings.
        where(created_at:
                (Time.zone.now.beginning_of_week)..(Time.zone.now.end_of_week))
    @monthly_spendings =
      current_user.spendings.
        where(created_at:
                (Time.zone.now.beginning_of_month)..
              (Time.zone.now.end_of_month))
  end
end
