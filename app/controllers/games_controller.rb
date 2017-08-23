class GamesController < ApplicationController

  def create
    @user = User.find_by(id: params[:game][:user])
    @game = Game.new(user: @user, score: params[:game][:score], start_time: params[:game][:start_time], end_time: params[:game][:end_time])
    if @game.save
      render json: {id: @game.id}
    else
      render json: {status: 400, errors: ["Could not create a new game, Please reach out to our team"]}, status: 400
    end
  end

  def destroy
    @user = User.find_by(id: params[:game][:user])
    @game = Game.find_by(id: params[:game][:id], user: @user)
    if @game
      @game.destroy
      render json: {status: 200}, status: 200
    else
      render json: {status: 400, errors: ["Game can't be destroyed", "Please reach out to a team member"]}, status: 400
    end
  end

  def update
    @game = Game.find_by(id: params[:game][:id], user: params[:game][:user])
    if @game
      @game.update(score: params[:game][:score], end_time: params[:game][:end_time])
      render json: @game
    else
      render json: {status: 400, errors: ["Game could not be updated", "Please reach out to our team"]}, status: 400
    end
  end

end
