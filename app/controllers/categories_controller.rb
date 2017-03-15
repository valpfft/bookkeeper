class CategoriesController < ApplicationController
  include Calendar
  before_action :authenticate_user!

  def index
    @categories = Category.all.where(user: current_user)
    @new_category = Category.new
    respond_to do |format|
      format.html
      format.json { render json: @autocomplete.map(&:name) }
    end
  end

  def show
    @year = params[:year] ? params[:year].to_i : Time.now.year
    @next_year = @year.to_i + 1
    @prev_year = @year.to_i - 1
    @months = months params
    @category = find_category
    @spendings =
      @category.spendings.
        where("extract(year from created_at) = ?", @year).
        where("extract(month from created_at) = ?", @months[:current][:number])
    @spendings_chart =
      Spending.all.
        where(category_id: @category.id).
        where("extract(year from created_at) = ?", @year).
        where("extract(month from created_at) = ?", @months[:current][:number]).
        group(:name).sum(:amount)
    @total_spendings_this_month =
      @category.spendings.
        where("extract(year from created_at) = ?", @year).
        where("extract(month from created_at) = ?", @months[:current][:number]).
        sum(:amount)
    @count_spendings_this_month =
      @category.spendings.
        where("extract(year from created_at) = ?", @year).
        where("extract(month from created_at) = ?", @months[:current][:number]).
        count
    @stats = {
      "Total spending's in this category": @total_spendings_this_month.to_s,
      "Total items in this category": @count_spendings_this_month.to_s,
    }
  end

  def create
    @category = Category.new(category_params)

    if !@category.save
      flash[:notice] = @category.errors.full_messages.join(", ").to_s
    end

    redirect_to categories_path
  end

  def edit
    @category = find_category
  end

  def update
    category = find_category

    if category.update(category_params)
      redirect_to({ action: "index" },
                   notice: "#{category.name} was successfully updated.")
    else
      redirect_to({ action: "edit" },
                   alert: category.errors.full_messages.join(", "))
    end
  end

  def destroy
    @category = find_category
    @category.destroy
    flash[:notice] = "Deleted " + @category.name

    redirect_to categories_path
  end

  private

  def find_category
    Category.find(params[:id])
  end

  def category_params
    params.
      require(:category).
      permit(:name).
      merge(user: current_user)
  end
end
