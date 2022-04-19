class MessagesController < ApplicationController
  
  def index
    @message = Message.new

    @messages = Message.public_messages
    @users = Connection.where(person: Current.user.id)
  end

  def create
    @message = Message.create(message_params)

    # if @message.save
    #   redirect_to messages_path
    # end

  end

  private def message_params
    params.permit(:name, :content, :sender_id, :receiver_id)
  end
end
