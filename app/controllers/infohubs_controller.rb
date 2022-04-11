class InfohubsController < ApplicationController
  def show
    @years = Year.all
    @crops = Crop.all

    # params = info_params
    # @result = CropProduction.where("year_id: ? AND crop_id: ?", params[:year_id], params[:crop_id])

    if(params[:crop_id] && result = CropProduction.find(params[:crop_id]))
      @result = result
    else
      @result = CropProduction.find(1)
    end
  end

  # private def info_params
  #   params.permit(:year_id, :crop_id)
  # end
end
