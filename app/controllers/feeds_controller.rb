class FeedsController < ApplicationController
  def index
    @discussions = Discussion.limit(5).order("count DESC")

    @posts = Post.all
  end
end
