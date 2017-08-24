class UsersController < ApplicationController
  before_action :user_params, only: [:create]

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      render json: {id: @user.id}
    else
      render json: {errors: @user.errors.full_messages}
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    if @user
      if @user.games.empty?
        @user_games = []
      else
        @highscore = @user.games.order(score: :desc).limit(1)
        @user_games = @user.games.order(updated_at: :desc).limit(3).map do |game|
          { score: game.score,
            duration: game.duration,
            created_at: game.created_at.strftime("%m/%d/%Y"),
            highscore_score: @highscore[0].score,
            highscore_date: @highscore[0].created_at.strftime("%m/%d/%Y")
          }
        end
      end
      @user_games << { username: @user.username }
      render json: @user_games
    else
      render json: {errors: ["User does not exist"]}
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
