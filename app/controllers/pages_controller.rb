class PagesController < ApplicationController
  def home
  end

  def main
    @creations = Creation.all
    @events = Event.all
    @categories = ["fab fa-canadian-maple-leaf", "fas fa-palette", "fas fa-cookie-bite", "fas fa-film",
                   "fas fa-microchip", "fas fa-feather-alt", "fas fa-bars"]
  end
end

# Cooking
# Collection
# Cinematography
# Garden
# Technology (electric toy car, engineering projects, crazy scientific stuff)
# Writing (storytelling, poetry)
# Miscellaneous
