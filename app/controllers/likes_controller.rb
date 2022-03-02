class LikesController < ApplicationController
  def create
    @like = Like.new(creation: @creation, user: current_user)
    @like.save!
  end

  def destroy
    my_like.destroy!
    redirect_to creation_path(params[:my_creation])
  end
end
