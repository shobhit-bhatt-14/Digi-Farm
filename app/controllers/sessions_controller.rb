class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by(email: params[:email])

        if user.present? && user.authenticate(params[:password])
            session[:user_id] = user.id
            flash[:notice] = "Welcome #{user.first_name}"
            redirect_to feeds_path
        else
            flash[:alert] = "Invalid email or password"
            render :new
        end
    end
    
    def destroy
        session[:user_id] = nil
        redirect_to root_path, notice: "Signed out successfully"
    end
end