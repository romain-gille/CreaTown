class LikesController < ApplicationController
  def create
    @creation = Creation.find(params[:creation_id])
    @like = Like.new(creation: @creation, user: current_or_guest_user)
    @like.save!
    respond_to do |format|
      format.html { redirect_to creation_path(@creation) }
      format.text do
        render partial: "partials/like", locals: { my_creation: @creation, my_like: @like }, formats: [:html]
      end
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @creation = @like.creation
    @like.destroy!
    respond_to do |format|
      format.html { redirect_to creation_path(@creation) }
      format.text do
        render partial: "partials/like", locals: { my_creation: @creation, my_like: @like }, formats: [:html]
      end
    end
  end
end
