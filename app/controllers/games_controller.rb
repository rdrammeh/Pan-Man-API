class GamesController < ApplicationController
  before_action :game_params, only: [:create]

  def create
    @game = Game.new(game_params)
    render json: {id: @game.id}
  end

  def destroy
    @game = Game.find_by(id: params[:game][:id], user: params[:game][:user])
    if @game
      @game.destroy
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

  private

  def game_params
    params.require(:game).permit(:user_id, :score, :start_time, :end_time)
  end

end
