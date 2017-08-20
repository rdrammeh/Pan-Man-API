class UsersController < ApplicationController
  before_action :user_params, only: [:create]

  def index
    render json: @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
    # else
    #   render json: {status: 503, error: "B"}
    end
    render json: {id: @user.id}
  end

  def show
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
    # else
    #   status: 503
    end
    render json: @user
  end

  def destroy
    session.clear
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
