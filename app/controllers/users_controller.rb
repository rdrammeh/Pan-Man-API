class UsersController < ApplicationController
  before_action :user_params, only: [:create]

  def index
    render json: @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      render json: {id: @user.id}
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    if @user
      session[:user_id] = @user.id
      render json: @user
    end
  end

  def destroy
    session.clear
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
