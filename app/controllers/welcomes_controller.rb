class WelcomesController < ApplicationController

    def index
        if session[:user_id]
            @user = User.find(session[:user_id])
        end
    end

    def check
        redirect_to feeds_path
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.
            session[:user_id] = @user.id
            redirect_to root_path, notice: "Registration successful"
        else
            render :new
        end
    end

    private def user_params
        params.require(:user).permit(:first_name, :last_name, :phone, :email, :password, :password_confirmation)
    end
end