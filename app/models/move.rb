class Move < ApplicationRecord
  belongs_to :game

  validates :latitude, :longitude, :game, presence: true
end
