class PagesController < ApplicationController
  def home
  end

  def main
    @categories = ["fas fa-paint-brush", "fas fa-utensils", "fas fa-camera-retro",
                   "fas fa-stream", "fas fa-seedling"]
    @cat_name = ["art", "cooking", "photography", "collections", "garden"]
  

    if params[:query].present?
      index = @categories.index(params[:query])
      @creations = Creation.where(category: @cat_name[index])
    else
      @creations = Creation.all
    end
    @events = Event.all

  end
end

# Art
# Cooking
# Photography
# Collections
# Gardening
