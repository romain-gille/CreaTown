class PagesController < ApplicationController
  def home
  end

  def main
    @categories = ["fab fa-canadian-maple-leaf", "fas fa-palette", "fas fa-cookie-bite", "fas fa-film",
                   "fas fa-microchip", "fas fa-feather-alt", "fas fa-bars"]
    cat_name = ["art", "collections", "cooking", "photography", "technology", "garden", "misc"]
    if params[:query].present?
      index = @categories.index(params[:query])
      @creations = Creation.where(category: cat_name[index])
    else
      @creations = Creation.all
    end
    @events = Event.all

    @markers = @events.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude,
        info_window: render_to_string(partial: "partials/info-window", locals: { event: event })
      }
    end
  end

  respond_to do |format|
    format.html { redirect_to main_path }
    format.text { render partial: 'partials/events-main', locals: { events: @events }, formats: [:html] }
  end
end
