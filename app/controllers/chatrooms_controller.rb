class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def index
    @chatrooms = Chatroom.all.filter do |chat|
      chat.user_connected_id == current_user.id || chat.user_messaged_id == current_user.id
    end
  end
end
