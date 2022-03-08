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

  def create
    @chatroom = Chatroom.new(strong_params)

    if @chatroom.save
      redirect_to chatroom_path(@chatroom)
    else
      render :new
    end
  end

  def update
    @chatroom = Chatroom.find(params[:id])
    redirect_to chatroom_path(@chatroom)
  end

  private

  def strong_params
    params.require(:chatroom).permit(:name, :user_connected_id, :user_messaged_id)
  end
end
