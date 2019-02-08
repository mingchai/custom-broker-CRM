class Api::V1::UsersController < ApplicationController
  def index
    users = User.all
    render json: users
  end

  def show
      render json: user
  end

private
  def user
    @user ||= Client.find params[:id]
  end
end
