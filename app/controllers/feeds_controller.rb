class FeedsController < ApplicationController
  def index
    @discussions = Discussion.limit(5).order("count DESC")

    @feeds = Feed.all
    # @feed = Feed.find(params[:id])
  end

  def show
    @feed = Feed.find(params[:id])

    @users = User.all
  end
end
