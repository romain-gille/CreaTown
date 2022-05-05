class ParticipationsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @participation = Participation.new(event: @event, user: current_or_guest_user)
    @participation.save!
    respond_to do |format|
      format.html { redirect_to event_path(@event) }
      format.text do
        render partial: "partials/participation", locals: { my_event: @event, my_participation: @participation },
               formats: [:html]
      end
    end
  end

  def destroy
    @participation = Participation.find(params[:id])
    @event = @participation.event
    @participation.destroy!
    respond_to do |format|
      format.html { redirect_to event_path(@event) }
      format.text do
        render partial: "partials/participation", locals: { my_event: @event, my_participation: @participation },
               formats: [:html]
      end
    end
  end
end
