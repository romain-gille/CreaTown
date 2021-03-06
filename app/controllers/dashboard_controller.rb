class DashboardController < ApplicationController
  before_action :set_user
  def mycreations
    @categories = ["fas fa-paint-brush", "fas fa-utensils", "fas fa-camera-retro",
                   "fas fa-stream", "fas fa-seedling"]
    @cat_name = ["art", "cooking", "photography", "collections", "garden"]
    @creations = current_or_guest_user.creations
  end

  def likedcreations
    @categories = ["fas fa-paint-brush", "fas fa-utensils", "fas fa-camera-retro",
                   "fas fa-stream", "fas fa-seedling"]
    @cat_name = ["art", "cooking", "photography", "collections", "garden"]
    @creations_liked = current_or_guest_user.liked_creations
  end

  def myevents
    @categories = ["fas fa-paint-brush", "fas fa-utensils", "fas fa-camera-retro",
                   "fas fa-stream", "fas fa-seedling"]
    @cat_name = ["art", "cooking", "photography", "collections", "garden"]
    @events = current_or_guest_user.events
  end

  def attendedevents
    @categories = ["fas fa-paint-brush", "fas fa-utensils", "fas fa-camera-retro",
                   "fas fa-stream", "fas fa-seedling"]
    @cat_name = ["art", "cooking", "photography", "collections", "garden"]
    @events_attended = current_or_guest_user.attended_events
  end

  private

  def set_user
    @user = current_or_guest_user
  end
end
