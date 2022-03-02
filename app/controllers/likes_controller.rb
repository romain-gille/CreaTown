class LikesController < ApplicationController
  def create
    @creation = Creation.find(params[:creation_id])
    @like = Like.new(creation: @creation, user: current_user)
    @like.save!

    redirect_to creation_path(@creation)
  end

  def destroy
    @like = Like.find(params[:id])
    @creation = @like.creation
    @like.destroy!

    redirect_to creation_path(@creation)
  end
end
