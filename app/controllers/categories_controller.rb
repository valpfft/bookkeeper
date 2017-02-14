class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = Category.all.where(user_id: current_user.id)
    @new_category = Category.new
  end

  def show
    @category = find_category
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
      merge(user_id: current_user.id)
  end
end
