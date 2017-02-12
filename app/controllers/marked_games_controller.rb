class MarkedGamesController < ApplicationController
  def create
    @marked_game = MarkedGame.new(marked_games_params)
    @marked_game.user_id = current_user.id
    
    case params[:commit]
    when "Played"
      @marked_game.status = 0
    when "Must Play"
      @marked_game.status = 1
    when "May Play"
      @marked_game.status = 2
    when "Playing"
      @marked_game.status = 3
    when "Not Interested"
      @marked_game.status = 4
    end
    
    @marked_game.save
    
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end
    
  private
  
  def marked_games_params
    params.require(:marked_game).permit(:game_id)
  end
end