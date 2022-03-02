class DashboardController < ApplicationController
  def mycreations
    @user = current_user
    @creations =  current_user.creations
  end

  def likedcreations
  end

  def myevents
  end

  def attendedevents
  end
end
