class CommentsController < ApplicationController
  def create
    @feed = Feed.find(params[:feed_id])
    @comment = @feed.comments.create(comment_params)
    redirect_to feed_path(@feed)
  end

  def destroy
    @feed = Feed.find(params[:feed_id])
    @comment = @feed.comments.find(params[:id])
    @comment.destroy
    redirect_to feed_path(@feed)
  end

  private def comment_params
    params.require(:comment).permit(:feed_id, :user_id, :content)
  end
end
