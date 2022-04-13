class ProfilesController < ApplicationController
  def index
    @place = Region.find(Current.user.region_id).name

    @connections = Connection.where(user_id: Current.user.id)

    @feeds = Feed.where(user_id: Current.user.id).order("created_at DESC")
  end

  def show
    @person = User.find_by(id: params[:id])
    @place = Region.find(@person.region_id).name

    @connect = Connection.find_by(user_id: Current.user.id, person: params[:id])
    if @connect.present?
      @val = true
    else
      @val = false
    end

    @connections = Connection.where(user_id: params[:id])

    @feeds = Feed.where(user_id: params[:id]).order("created_at DESC")
  end

  def create
    @connection1 = Connection.new(user_id: Current.user.id, person: params[:id])
    @connection2 = Connection.new(user_id: params[:id], person: Current.user.id)

    if @connection1.save && @connection2.save
      @val = true
    end

    respond_to do |format|
      format.js
    end
  end
end
