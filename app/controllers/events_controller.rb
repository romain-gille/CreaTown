class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(strong_params)
    @event.user = current_user
    if @event.save
      redirect_to myevents_path
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def strong_params
    params.require(:event).permit(:location, :date, :description, :photo, :title)
  end
end
