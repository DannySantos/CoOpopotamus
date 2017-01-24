class GamesController < ApplicationController
  def index
    if params[:page_size].blank? || params[:page_number].blank?
      redirect_to games_path(page_size: 25, page_number: 1)
    end
    
    @page_size = params[:page_size].to_i
    if @page_size = 0
      @page_size = 25
    end
    
    @page_number = params[:page_number].to_i
    @pagination_number = @page_number
    @pagination_number -= 5 unless @page_number < 6
    
    @next_page = @page_number + 1
    @prev_page = @page_number - 1
    
    @first_page = @page_number == 1
    @last_page = false
    
    @last_page_number = (Game.count.to_f / @page_size).ceil
    
    @games = Game.limit(@page_size).offset(get_offset(@page_number, @page_size))

    unless @posts.nil?
      @last_page = @games.count < @page_size + 1
    end
  end
  
  def get_offset(page_number, page_size)
    (page_number - 1) * page_size
  end
end