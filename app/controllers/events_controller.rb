class EventsController < ApplicationController
  def new
    @event = Event.new
    @creations = current_user.creations
  end

  def create
    @event = Event.new(strong_params)
    @event.user = current_user
    if @event.save
      params[:event][:creations].each do |creation_id|
        EventCreation.create(creation_id: creation_id, event: @event)
      end
      redirect_to myevents_path
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
    @creations = @event.creations
    @categories = ["fas fa-paint-brush", "fas fa-utensils", "fas fa-camera-retro",
                   "fas fa-stream", "fas fa-seedling"]
    @cat_name = ["art", "cooking", "photography", "collections", "garden"]
    @markers = []
    @markers << { lat: @event.latitude, lng: @event.longitude,
                  info_window: render_to_string(partial: "partials/info-window", locals: { event: @event }) }

    my_chatrooms = Chatroom.all.filter { |chat| chat.user_connected_id == current_user.id }
    if my_chatrooms.filter { |chat| chat.user_messaged_id == @event.user.id }.empty?
      @chatroom = Chatroom.new
    else
      @chatroom = Chatroom.all.find { |chat| chat.user_messaged_id == @event.user.id }
    end
  end

  private

  def strong_params
    params.require(:event).permit(:location, :date, :description, :photo, :title)
  end
end
