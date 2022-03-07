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
    @markers = []
    @markers << { lat: @event.latitude, lng: @event.longitude }
  end

  private

  def strong_params
    params.require(:event).permit(:location, :date, :description, :photo, :title)
  end
end
