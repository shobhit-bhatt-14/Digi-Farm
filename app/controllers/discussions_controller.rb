class DiscussionsController < ApplicationController
  def index
    @discussions = Discussion.all
    @regions = Region.all
    @users = User.all

    @location = 35
    def change_location loc
      @location = loc
    end

    # respond_to do |format|
    #   format.html { render @discussions }
    # end
  end

  def show
    @discussion = Discussion.find(params[:id])
    @regions = Region.all
    @users = User.all

    @location = @discussion.region_id

    # Array.wrap()
    @answers = Answer.where(discussion_id: params[:id])
    @answer = Answer.new
  end

  def new
    @discussion = Discussion.new
  end

  def create
    # Rails.logger("Answer", @answer)

    @discussion = Discussion.new(discussion_params)

    if @discussion.save
      redirect_to discussion_path(@discussion)
    end
  end

  def edit
    @discussion = Discussion.find(params[:id])
  end

  def update
    @discussion = Discussion.find(params[:id])

    if @discussion.update
      redirect_to discussion_path(@discussion)
    end
  end

  def destroy
    @discussion = Discussion.find(params[:id])
    @discussion.destroy

    redirect_to discussions_path
  end

  private def discussion_params
    params.permit(:user_id, :region_id, :content)
  end
end


