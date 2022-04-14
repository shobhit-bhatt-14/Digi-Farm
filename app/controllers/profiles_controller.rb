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

    redirect_to request.path
  end

  def edit
    @connections = Connection.where(user_id: Current.user.id)

    @feeds = Feed.where(user_id: Current.user.id).order("created_at DESC")

    @regions = Region.all
    
    @user = Current.user
  end

  def update
    @user = User.find_by(id: Current.user.id)

    if @user.update(user_params)
      redirect_to "/profile"
    end
  end

  private def user_params
    params.require(:user).permit(:first_name, :last_name, :region_id, :fav_plant)
  end
end
