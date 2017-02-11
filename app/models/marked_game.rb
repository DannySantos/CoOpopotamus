class MarkedGame < ApplicationRecord
  belongs_to :user
  belongs_to :game
  
  enum status: ["Played", "Must Play"]
end
