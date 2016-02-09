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
    # expecting: data = {"grid":{"size":4,"cells":[[null,null,null,null],[null,null,null,null],[null,null,{"position":{"x":2,"y":2},"value":2},{"position":{"x":2,"y":3},"value":4}],[null,{"position":{"x":3,"y":1},"value":4},{"position":{"x":3,"y":2},"value":8},{"position":{"x":3,"y":3},"value":16}]]},"score":68,"over":false,"won":false,"keepPlaying":false}

    game = Game.new
    game.grid = params["grid"]
    game.score = params["score"]
    game.over = params["over"]
    game.won = params["won"]
    game.keep_playing = params["keepPlaying"]

    if game.save
      render :json => [], :status => :ok
    else
      render :json => [], :status => :no_content
    end

  end

end
