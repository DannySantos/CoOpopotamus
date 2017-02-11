class MarkedGamesController < ApplicationController
  def create
    @marked_game = MarkedGame.new(marked_games_params)
    @marked_game.user_id = current_user.id
    
    case params[:commit]
    when "Mark as Played"
      @marked_game.status = 0
    when "Mark as Must Play"
      @marked_game.status = 1
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