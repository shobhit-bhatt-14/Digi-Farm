class ConversationsController < ApplicationController
  def index
    @conversations = Conversation.public_rooms
    @users = Connection.where(person: Current.user.id)
  end
end
