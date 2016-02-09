class UsersController < ApplicationController
  before_action :current_user
  before_action :require_login

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

  def destroy

  end

  def leaderboard
  end
end
