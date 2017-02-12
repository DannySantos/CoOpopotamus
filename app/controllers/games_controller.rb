class GamesController < ApplicationController
  def index
    @marked_game = MarkedGame.new
    if current_user
      games = Game.where('id not in (select game_id from marked_games where user_id = ?)', current_user.id)
      @games = games.paginate(page: params[:page], per_page: 25)
    else
      @games = Game.all.paginate(page: params[:page], per_page: 25)
    end
  end
  
  def get_offset(page_number, page_size)
    (page_number - 1) * page_size
  end
end