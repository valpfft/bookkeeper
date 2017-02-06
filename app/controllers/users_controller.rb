class UsersController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized

  def index
    @users = User.all
    authorize User
    @users_grid = UsersGrid.new(params[:users_grid])
    respond_to do |f|
      f.html do
        @users_grid.scope { |scope| scope.page(params[:page]) }
      end
      f.csv do
        send_data @users_grid.to_csv,
        type: "text/csv",
        disposition: "inline",
        filename: "bookkeeper-users-#{Time.now}.csv"
      end
    end
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def destroy
    user = User.find(params[:id])
    authorize user
    user.destroy
    redirect_to users_path, notice: "User was successfully deleted"
  end

  def update
    @user = User.find(params[:id])
    authorize @user

    if @user.update_attributes(user_params)
      redirect_to users_path, success: "User updated"
    else
      redirect_to users_path, alert: "Unable to update"
    end
  end

  private

  def user_params
    params.require(:user).permit(:role)
  end
end
