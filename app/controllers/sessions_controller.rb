class SessionsController < ApplicationController

  def create
    @user = User.find_by(email: params[:login][:email])
    if @user && @user.authenticate(params[:login][:password])
      session[:user_id] = @user.id
      render json: @user
    else
      render json: {errors: @user.errors.full_messages}
    end
  end

  def destroy
    session.clear
  end

end
