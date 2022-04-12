class InfohubsController < ApplicationController
  
  def show
    @years = Year.all
    @crops = Crop.all
  end
  
  def create
    @years = Year.all
    @crops = Crop.all

    @result = CropProduction.find_by(crop_id: params[:crop_id], year_id: params[:year_id])

    respond_to do |format|
      format.js {render layout: false}
    end
  end
end
