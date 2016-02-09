class UsersController < ApplicationController
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
  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end
end
