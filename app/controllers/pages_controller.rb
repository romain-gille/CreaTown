class PagesController < ApplicationController
  def home
  end

  def dashboard
    #@user = User.all.filter { |user| user == current_user }
    @user = User.all.sample
    #@creations = Creation.all.filter { |creation| creation.user == current_user }
    @creations = Creation.all.sample
  end
end
