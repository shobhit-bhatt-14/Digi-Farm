class DiscussionsController < ApplicationController
  helper_method :get_user, :change_location

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
    def get_user userId
      return User.find(userId)
    end

    @discussion = Discussion.find(params[:id])

    # Array.wrap()
    @answers = Answer.where(discussion_id: params[:id])
    @answer = Answer.new
  end

  def new
    @discussion = Discussion.new
  end

  def create
    # @answer = Answer.new(params["answer"].permit(:user_id, :content, :discussion_id))
    # Rails.logger("Answer", @answer)
    # params["discussion"].permit(:user_id, :region, :content)

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


