class InfohubsController < ApplicationController
  def show
    @regions = Region.all
  end
end
