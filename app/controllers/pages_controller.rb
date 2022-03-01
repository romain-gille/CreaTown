class PagesController < ApplicationController
  def home
  end

  def main
    @creations = Creation.all
    @events = Event.all
    @categories = ["fab fa-canadian-maple-leaf", "fas fa-palette", "fas fa-cookie-bite", "fas fa-film",
                   "fas fa-microchip", "fas fa-feather-alt", "fas fa-bars"]
  end
  
  def dashboard
    #@user = User.all.filter { |user| user == current_user }
    @user = User.all.sample
    #@creations = Creation.all.filter { |creation| creation.user == current_user }
    @creations = Creation.all.sample
  end
end

# Cooking
# Collection
# Cinematography
# Garden
# Technology (electric toy car, engineering projects, crazy scientific stuff)
# Writing (storytelling, poetry)
# Miscellaneous
