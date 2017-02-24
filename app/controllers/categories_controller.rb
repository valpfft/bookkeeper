class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = Category.all.where(user: current_user)
    @new_category = Category.new
  end

  def show
    @category = find_category
    @spendings = @category.spendings.last(20)
    @spendings_chart =
      Spending.all.
        where(category_id: @category.id).group(:name).sum(:amount)
  end

  def create
    @category = Category.new(category_params)

    if !@category.save
      flash[:notice] = @category.errors.full_messages.join(", ").to_s
    end

    redirect_to categories_path
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
