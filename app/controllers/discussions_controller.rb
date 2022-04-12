class DiscussionsController < ApplicationController
  def index
    @regions = Region.all

    if (params[:region_id] && discussions = Discussion.where(region_id: params[:region_id]))
      @discussions = discussions
    else
      @discussions = Discussion.all
    end

    # respond_to do |format|
    #   format.html { render partial: "discussions/discussions", locals: {discussions: @discussions} }
    # end
  end

  def show
    @discussion = Discussion.find(params[:id])
    @regions = Region.all
  end

  def new
    @discussion = Discussion.new
  end

  def create
    if params[:content].present?
      @discussion = Discussion.new(discussion_params)

      if @discussion.save
        redirect_to discussion_path(@discussion)
      end
    else
      @discussions = Discussion.where(region_id: params[:region_id])

      respond_to do |format|
        format.js {render layout: false}
      end
    end
  end

  # def edit
  #   @discussion = Discussion.find(params[:id])
  # end

  # def update
  #   @discussion = Discussion.find(params[:id])

  #   if @discussion.update
  #     redirect_to discussion_path(@discussion)
  #   end
  # end

  def destroy
    @discussion = Discussion.find(params[:id])
    @discussion.destroy

    redirect_to discussions_path
  end

  private def discussion_params
    params.permit(:user_id, :region_id, :content)
  end
end


