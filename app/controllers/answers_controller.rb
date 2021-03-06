class AnswersController < ApplicationController
    def create
        @discussion = Discussion.find(params[:discussion_id])
        @answer = @discussion.answers.create(answer_params)
        redirect_to discussion_path(@discussion)
    end

    def destroy
        @discussion = Discussion.find(params[:discussion_id])
        @answer = @discussion.answers.find(params[:id])
        @answer.destroy
        redirect_to discussion_path(@discussion)
    end

    private def answer_params
        params.require(:answer).permit(:discussion_id, :user_id, :content)
    end
end
