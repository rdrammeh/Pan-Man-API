class SessionsController < ApplicationController

  def create
    @user = User.find_by(email: params[:login][:email])
    if @user && @user.authenticate(params[:login][:password])
      session[:user_id] = @user.id
      render json: {id: @user.id}
    else
      render json: {status: 400, errors: ["User does not exist", "Please make an account"]}, status: 400
    end
  end

  def destroy
    session.clear
  end

  private

  def user_params
    params.require(:session).permit(:username, :email, :password)
  end

end
