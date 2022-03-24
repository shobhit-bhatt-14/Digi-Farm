class AnswersController < ApplicationController
    helper_method :get_user

    def index
        def get_user userId
            return User.find(userId)
        end
    end

    def create
        @discussion = Discussion.find(params[:discussion_id])
        @answer = @discussion.answers.create(answer_params)
        redirect_to discussion_path(@discussion)
    end

    private def answer_params
        params.require(:answer).permit(:discussion_id, :user_id, :content)
    end
end
