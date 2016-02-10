class GamesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :current_user

  def load_game
    game = Game.find(params[:id])

    if game && game.user_id == @current_user.id
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
    game.user_id = @current_user.id
    if @current_user.best_score < params["score"].to_i
      @current_user.best_score = params["score"].to_i
      @current_user.save
    end

    if game.save
      render :json => [], :status => :ok
    else
      render :json => [], :status => :no_content
    end

  end

  def destroy
    game = Game.find(params[:id])
    game.delete
    redirect_to user_path(@current_user)
  end

end
