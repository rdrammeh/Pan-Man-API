class ScoresController < ApplicationController

  def all
    @games = Game.all
    @ordered_scores = @games.order(score: :desc)
    
    render json: @ordered_scores
  end

  def show
    @game = Game.find_by(id: params[:id])
    render json: @game
  end

end
