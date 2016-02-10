class UsersController < ApplicationController
  before_action :current_user
  before_action :require_login

  def index
    # leaderboard
    @leaders = []

    User.all.each do |user|
      @leaders.push([user, user.best_score])
    end

    @leaders = @leaders.sort_by {|user| user[1]}.reverse
  end

  def show
    # home page with saved games
    @games = @current_user.games
  end

  def destroy

  end

end
