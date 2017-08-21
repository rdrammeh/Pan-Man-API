class UsersController < ApplicationController
  before_action :user_params, only: [:create]

  def index
    render json: @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      render json: @user
    else
      render json: {errors: @user.errors.full_messages}
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    if @user
      session[:user_id] = @user.id
      render json: @user
    else
      render json: {errors: ["User does not exist"]}
    end
  end

  private

  def user_params
    params.require(:register).permit(:username, :email, :password)
  end

end
