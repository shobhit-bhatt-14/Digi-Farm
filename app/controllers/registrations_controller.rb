class RegistrationsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        # @user = User.new(user_params)
        render plain: params
    end
end