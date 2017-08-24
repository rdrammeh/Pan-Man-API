class ScoresController < ApplicationController

  def all
    @games = Game.all
    @ordered_scores = @games.order(score: :desc).limit(10)
    @global_scores = @ordered_scores.map do |game|
      { id: game.id,
      score: game.score,
      start_time: game.start_time,
      end_time: game.end_time,
      user: game.user.username,
      created_at: game.created_at,
      updated_at: game.updated_at }
    end
    render json: @global_scores
  end

  def show
    @game = Game.find_by(id: params[:id])
    render json: @game
  end

end
