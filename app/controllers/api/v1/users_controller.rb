class Api::V1::UsersController < Api::ApplicationController
  def index
    users = User.all
    render json: users
  end

  def show
      render json: user
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      render json: user
    else
      render json: {errors: user.errors, status:422}
    end
  end

private
  def user
    @user ||= User.find params[:id]
  end
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :admin)
  end
end
