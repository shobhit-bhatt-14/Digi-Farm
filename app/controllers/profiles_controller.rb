class ProfilesController < ApplicationController
  def index
    @connections = Connection.where(user_id: Current.user.id).order("id DESC")

    @feeds = Feed.where(user_id: Current.user.id).order("created_at DESC")
  end

  def show
    @person = User.find_by(id: params[:id])

    @connections = Connection.where(user_id: params[:id]).order("id DESC")

    @feeds = Feed.where(user_id: params[:id]).order("created_at DESC")
  end
end
