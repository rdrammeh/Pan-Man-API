class GamesController < ApplicationController

  def all
    @games = Game.all
    @ordered_scores = @games.order(score: :desc)
    render json: @ordered_scores
  end

end
