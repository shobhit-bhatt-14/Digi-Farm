class ApplicationController < ActionController::Base
    before_action :set_current_user
    # , :set_current_location

    def set_current_user
        if session[:user_id]
            Current.user = User.find_by(id: session[:user_id])
        end
    end

    # def set_current_location
    #     Current.location = Region.find_by(id: 35)
    # end
end