class PagesController < ApplicationController
  def home
    u = User.new(user_name: "guest", email: "guest_#{rand(100)}@example.com")
    u.save!(validate: false)
    session[:guest_user_id] = u.id
    u
    current_or_guest_user = current_or_guest_user
    # before_action :authenticate_user!
    # binding.pry
  end

  def main
    @categories = ["fas fa-paint-brush", "fas fa-utensils", "fas fa-camera-retro",
                   "fas fa-stream", "fas fa-seedling"]
    @cat_name = ["art", "cooking", "photography", "collections", "garden"]

    if params[:query].present?
      index = @categories.index(params[:query])
      @creations = Creation.where(category: @cat_name[index])
      @filter = @cat_name[index]

    else
      @creations = Creation.all
    end
    @events = Event.all
  end

  def map
    @events = Event.all
    @markers = @events.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude,
        info_window: render_to_string(partial: "partials/info-window", locals: { event: event })
      }
    end
  end
end

# Art
# Cooking
# Photography
# Collections
# Gardening
