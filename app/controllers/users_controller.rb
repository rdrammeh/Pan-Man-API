class UsersController < ApplicationController

  def index
    render json: @users = User.all
  end

  def new
  end

  def show
  end

# create sessions controller
  # user login
  # user register
# game
  # show
  # global highscoree
  # game destory
end
