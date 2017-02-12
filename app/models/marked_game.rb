class MarkedGame < ApplicationRecord
  belongs_to :user
  belongs_to :game
  
  enum status: ["Played", "Must Play", "May Play", "Playing", "Not Interested"]
  validates :game_id, uniqueness: true
end
