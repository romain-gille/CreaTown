class PagesController < ApplicationController
  def home
  end

  def index
    @creations = Creation.all
    @events = Event.all
  end
end
