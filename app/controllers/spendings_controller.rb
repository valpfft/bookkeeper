class SpendingsController < ApplicationController
  def index
    @new_spending = Spending.new
    @spendings = Spending.all.where(user_id: current_user.id)
  end

  def show
    @spending = find_spending
  end

  def create
    spending = Spending.new(spending_params)

    if !spending.save
      flash[:notice] = spending.errors.full_messages.join(", ").to_s
    end

    redirect_to spendings_path
  end

  def edit
    @spending = find_spending
  end

  def update
    spending = find_spending

    if spending.update(spending_params)
      return flash[:alert] = "Updated!"
    else
      return flash[:error] = spending.error_message
    end
  end

  def destroy
    @spending = find_spending
    @spending.destroy
    flash[:notice] = "Deleted " + @spending.name

    redirect_to spendings_path
  end

  private

  def find_spending
    Spending.find(params[:id])
  end

  def spending_params
    params.
      require(:spending).
      permit(:name, :amount, :category_id).
      merge(user: current_user)
  end
end
