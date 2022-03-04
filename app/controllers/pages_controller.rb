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

  end
end

# Art
# Collection
# Cooking
# Cinematography
# Technology (electric toy car, engineering projects, crazy scientific stuff)
# Garden
# Miscellaneous
