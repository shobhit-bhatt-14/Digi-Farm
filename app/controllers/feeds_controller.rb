class FeedsController < ApplicationController
  def index
    @discussions = Discussion.limit(5).order("count DESC")

    @feeds = Feed.all

    @users = User.all
  end

  def show
    @feed = Feed.find(params[:id])

    @users = User.all
  end
end
