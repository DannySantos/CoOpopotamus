class Game < ApplicationRecord
  has_many :marked_games
  has_many :users, through: :marked_games
end
