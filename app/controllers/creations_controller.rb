class CreationsController < ApplicationController
  def new
    @creation = Creation.new
  end

  def create
    @creation = Creation.new(strong_params)
    @creation.user = current_user
    if @creation.save
      redirect_to creation_path(@creation)
    else
      render :new
    end
  end

  def show
    @creation = Creation.find(params[:id])
    if current_user.liked_creations.include?(@creation)
      @like = current_user.likes.find { |lik| lik.creation == @creation }
    else
      @like = Like.new
    end
  end

  private

  def strong_params
    params.require(:creation).permit(:name, :category, :description, :photos, :date)
  end
end
