class FeedsController < ApplicationController
  def index
    @discussions = Discussion.limit(5).order("count DESC")

    @feeds = Feed.all.order("created_at DESC")

    @users = User.all
  end

  def show
    @feed = Feed.find(params[:id])

    @users = User.all
  end

  def new
    @feed = Feed.new
  end

  def create
    @feed = Feed.new(feed_params)

    if @feed.save
      redirect_to feeds_path
    end
  end

  private def feed_params
    params.permit(:user_id, :content)
  end
end
