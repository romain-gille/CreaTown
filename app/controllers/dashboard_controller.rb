class DashboardController < ApplicationController
  before_action :set_user
  def mycreations
    @creations = current_user.creations
  end

  def likedcreations
    @creations_liked = current_user.liked_creations
  end

  def myevents
    @events = current_user.events
  end

  def attendedevents
    @events_attended = current_user.attended_events
  end

  private

  def set_user
    @user = current_user
  end
end
