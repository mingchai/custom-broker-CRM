class Api::V1::UsersController < Api::ApplicationController
  def index
    users = User.all.order(first_name: :asc)
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

  def current
    render json: {status: 200, current_user: ActiveModelSerializers::SerializableResource.new(current_user).as_json}
  end

private
  def user
    @user ||= User.find params[:id]
  end
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :admin)
  end
end
