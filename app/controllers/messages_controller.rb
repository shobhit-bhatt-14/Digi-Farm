class MessagesController < ApplicationController
  
  def index
    @message = Message.new

    # @messages = Message.public_messages
    @conversations = Message.where(sender_id: Current.user.id)

    @persons = Connection.where(person: Current.user.id)
  end

  def show
    @persons = Connection.where(person: Current.user.id)

    @person = User.find_by(id: params[:id])

    @message_name = get_name(@person.id, Current.user.id)

    @message = Message.find_by(name: @message_name)
    @message_values = @message.present? ? MessageValue.where(message_id: @message.id) : []
  end

  def new
    @message = Message.new
    @message_value = MessageValue.new
  end

  def update
    @message_name = get_name(params[:sender_id], params[:receiver_id])
    @message = Message.find_by(name: @message_name) ? Message.find_by(name: @message_name) : Message.create(name: @message_name, is_private: true, sender_id: params[:sender_id], receiver_id: params[:receiver_id])
    
    @message_value = MessageValue.create(content: params[:content], user_id: params[:sender_id], message_id: @message.id)

    redirect_to message_path(params[:id])
  end

  private
  def get_name(user1, user2)
    users = [ user1, user2 ].sort
    "private_#{users[0]}_#{users[1]}"
  end
end
