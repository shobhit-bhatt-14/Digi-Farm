class FeedsController < ApplicationController
  def index
    @discussions = Discussion.limit(5).order("count DESC")

    @feeds = Feed.all
    # @feed = Feed.find(params[:id])
  end

  def show
    @feed = Feed.find(params[:id])

    @comments = Comment.where(feed_id: params[:id])
    @comment = Comment.new
  end
end
