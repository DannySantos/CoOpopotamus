class GamesController < ApplicationController
  def index 
    @games = Game.all.paginate(page: params[:page], per_page: 25)
    @marked_game = MarkedGame.new
  end
  
  def get_offset(page_number, page_size)
    (page_number - 1) * page_size
  end
end