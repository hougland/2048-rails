class UsersController < ApplicationController
  before_action :current_user

  def index
    # leaderboard
    @leaders = {}

    User.all.each do |user|
      @leaders[user.username] = user.best_score
    end
    # need to sort leaders by score
  end

  def show
    # home page with saved games, etc.
    # @games = @current_user.games
  end

  def edit

  end

  def update

  end

  def destroy

  end
end
