class GamesController < ApplicationController

  def load_game
    game = Game.find_by(id: params[:id])
    if game
      render :json => game.as_json(except: [:created_at, :updated_at]), :status => :ok
    else
      render :json => [], :status => :no_content
    end
  end

  def save_game
    
  end

end
