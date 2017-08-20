class GamesController < ApplicationController
  before_action :game_params, only: [:create]

  def create
    @game = Game.new(game_params)
  end

  def destroy
    @game = Game.find_by(id: params[:id], user: current_user.id)
    if @game
      @game.destroy
    else
      render :status => 422
    end
  end

  private

  def game_params
    params.require(:game).permit(:score, :start_time, :end_time)
  end

end
